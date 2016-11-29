package eventMacro::Condition::InMap;

use strict;

use base 'eventMacro::Conditiontypes::ListConditionState';

use Globals qw( $field );

sub _hooks {
	['packet_mapChange'];
}

sub validate_condition {
	my ( $self, $callback_type, $callback_name, $args ) = @_;
	
	if ($callback_type eq 'variable') {
		$self->SUPER::update_validator_var($callback_name, $args);
	}
	
	$self->{lastMap} = $field->baseName;
	
	$self->SUPER::validate_condition($self->{lastMap});
}

sub get_new_variable_list {
	my ($self) = @_;
	my $new_variables;
	
	$new_variables->{".InMapLast"} = $self->{lastMap};
	
	return $new_variables;
}

1;
