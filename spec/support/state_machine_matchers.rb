require 'rspec/expectations'

# Validate state machine state
#
# Example:
#   it { should be_in_state("pending") }
#
# if the state machine is not called state, the field name can be specified with the on() method.
#
# Example:
#    it { should be_in_state("parked").on(:gear) }
#
# to check the state machine on the field :gear is in the state "parked".
RSpec::Matchers.define :be_in_state do |value|
  @value = value
  @field = :state

  match do |subject|
    subject.__send__(@field).to_s == @value.to_s
  end

  chain(:on) { |field| @field = field.to_sym }

  failure_message_for_should { |actual| "#{@field} should be #{@value.inspect}, not #{actual[@field].inspect}" }
  failure_message_for_should_not { |actual| "#{@field} should not be #{@value.inspect}" }
end

# Verify that a state machine object will accept and event and result in a specified state.
#
# Example:
#
#  it { should accept_event(:ignite) }
#  it { should_not accept_event(:park) }
#
# to use a custom state field:
#
# it { should accept_event(:ignite).on(:gear_state).and_be_in_state(:started) }
#
# This matcher can additionally verify that the resulting state is what is expected.
#
# Example:
#  it { should accept_event(:ignite).and_be_in_state(:started) }
#  it { should_not accept_event(:park).and_be_in_state(:parked) }
#
# In the should_not case, the not applies to the accepting of the event, and the matcher checks that
# that the resulting state is parked. This would be useful for asserting that a state machine object
# does not accept an event, and that even if you tried to send it to it, the resulting state would
# be exactly what you expect it to be.
#
# Note that checking the "and_be_in_state" actually fires the event (whether accepted or not).
# If the object with state machine is an active record model object, the object will only accept
# the event change if it is in a valid state, so this will only succeed if all other model validations
# pass. This is likely to be the expected behaviour, but may cause false negatives if a validation fails.
#
RSpec::Matchers.define :accept_event do |event|
  @event = event
  @field = :state
  @can_fire_event = false
  @final_state_match = false
  @new_state = nil

  chain(:on) { |field| @field = field }
  chain(:and_be_in_state) do |new_state|
    @new_state = new_state
  end

  match do |subject|
    state_events = "#{@field}_events".to_sym
    @can_fire_event = subject.__send__(state_events).include?(@event)
    if @new_state # additionally check the resulting state matches the expected new_state
      subject.__send__("fire_#{@field}_event", @event)
      subject.__send__(@field).to_sym == @new_state && @can_fire_event
    else
      @can_fire_event
    end
  end

  match_for_should_not do |subject|
    state_events = "#{@field}_events".to_sym
    @can_fire_event = subject.__send__(state_events).include?(@event)
    if @new_state # additionally check the resulting state matches the expected new_state
      subject.__send__("fire_#{@field}_event", @event)
      subject.__send__(@field).to_sym == @new_state && !@can_fire_event
    else
      !@can_fire_event
    end
  end

  failure_message_for_should do |actual|
    if @new_state
      "should be in final state #{@new_state.inspect} but was in state #{actual.__send__(@field).inspect}."
    else
      "should be able to accept event '#{@event}' but did not."
    end
  end

  failure_message_for_should_not do |actual|
    if @new_state
      "should not accept event #{@event.inspect} and should be in final state #{@new_state.inspect}, not #{actual.__send__(@field).inspect}"
    else
      "should not accept event #{@event.inspect}"
    end
  end
end


# This matcher verifies that only the specified events are available from the subject in its current state.
#
# Example:
#   it { should accept_only_events(:drive, :park) }
#
# You can optionally put the subject into a specified event by chaining .from_state(:state). This will set the
# state on the object (bypassing any validations required to get there).
#
# Example:
#
#  it { should accept_only_events(:drive, :park).from_state(:parked) }
#
# And you can specify the state attribute by chaining .on(:state). This defaults to :state
RSpec::Matchers.define :accept_only_events do |*events|
  @events = [*events].to_set
  @field = :state
  chain(:on) { |field| @field = field }
  chain(:from_state) do |initial_state|
    @initial_state = initial_state
  end

  match do |subject|
    state_events = "#{@field}_events".to_sym
    @actual_events = subject.__send__(state_events).to_set
    @actual_events == @events
  end

  match_for_should_not do |subject|
    raise "This matcher does not support should_not"
  end

  failure_message_for_should do |actual|
    "expected subject to accept only events: #{@events.to_a.inspect} but got events: #{@actual_events.to_a.inspect}"
  end
end
