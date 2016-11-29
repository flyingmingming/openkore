package eventMacro::Condition::AttackStartRegex;

use strict;
use Globals;
use Utils;

use eventMacro::Data;

use base 'eventMacro::Conditiontypes::RegexConditionEvent';

sub _hooks {
	['attack_start'];
}

sub validate_condition {
	my ( $self, $callback_type, $callback_name, $args ) = @_;
	
	if ($callback_type eq 'hook') {
		$self->{id} = $args->{ID};
		$self->SUPER::validate_condition($monsters{$self->{id}}{'name'});
	} elsif ($callback_type eq 'variable') {
		$self->SUPER::update_validator_var($callback_name, $args);
		return 0;
	}
}

sub get_new_variable_list {
	my ($self) = @_;
	my $new_variables;
	
	my $actor = $monsters{$self->{id}};
	
	$new_variables->{".AttackStartRegexLastName"} = $actor->{name};
	$new_variables->{".AttackStartRegexLastPos"} = sprintf("%d %d %s", $actor->{pos_to}{x}, $actor->{pos_to}{y}, $field->baseName);
	$new_variables->{".AttackStartRegexLastDist"} = sprintf("%.1f",distance(calcPosition($actor), calcPosition($char)));
	$new_variables->{".AttackStartRegexLastID"} = $actor->{binID};
	$new_variables->{".AttackStartRegexLastBinID"} = $actor->{binType};
	
	return $new_variables;
}

sub condition_type {
	EVENT_TYPE;
}

1;