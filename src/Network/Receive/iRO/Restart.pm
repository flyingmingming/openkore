#########################################################################
#  OpenKore - Network subsystem
#  Copyright (c) 2006 OpenKore Team
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#  Basically, this means that you're allowed to modify and distribute
#  this software. However, if you distribute modified versions, you MUST
#  also distribute the source code.
#  See http://www.gnu.org/licenses/gpl.html for the full license.
#########################################################################
# Servertype overview: http://wiki.openkore.com/index.php/ServerType
package Network::Receive::iRO::Restart;

use strict;
use base qw(Network::Receive::iRO);

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new(@_);
	
	my %packets;
	
	# Sync Ex Reply Array 
	$self->{sync_ex_reply} = {
		'0364' => '0892',
		'0867' => '08A3',
		'089F' => '0921',
		'0928' => '085E',
		'0931' => '087F',
		'0954' => '086C',
		'088B' => '0948',
		'0895' => '086F',
		'08AC' => '0886',
		'08C9' => '0967',
		'086D' => '091B',
		'093D' => '0879',
		'0894' => '0878',
		'085D' => '08AB',
		'0930' => '095A',
		'0A5A' => '0802',
		'085B' => '0941',
		'0884' => '0898',
		'0925' => '0966',
		'0952' => '0943',
		'0920' => '087C',
		'0929' => '0875',
		'0956' => '0874',
		'089A' => '0893',
		'094F' => '089B',
		'0202' => '0811',
		'094D' => '088E',
		'08AD' => '0362',
		'0917' => '0939',
		'092D' => '08A9',
		'0178' => '0860',
		'0436' => '0899',
		'0863' => '0437',
		'0935' => '0870',
		'0881' => '089E',
		'0918' => '093F',
		'0868' => '0876',
		'0871' => '0877',
		'08A0' => '0883',
		'0880' => '085F',
		'0940' => '083C',
		'0866' => '0933',
		'0919' => '0924',
		'0865' => '0955',
		'095D' => '094E',
		'093A' => '0817',
		'087A' => '092C',
		'0835' => '0889',
		'08A7' => '0363',
		'086E' => '0869',
		'00B8' => '0872',
		'08AA' => '096A',
		'0963' => '0965',
		'091C' => '08A5',
		'0127' => '0861',
		'0819' => '0960',
		'094B' => '035F',
		'088F' => '02C4',
		'091F' => '093E',
		'08A6' => '088D',
		'0962' => '0938',
		'0A68' => '0126',
		'0937' => '091A',
		'0926' => '07EC',
		'087B' => '0864',
		'095C' => '0968',
		'0438' => '0944',
		'094C' => '0961',
		'0882' => '0957',
		'087D' => '0A6C',
		'091D' => '0923',
		'095E' => '014F',
		'0368' => '09CE',
		'093B' => '0946',
		'088A' => '0959',
		'08A4' => '0947',
		'0945' => '094A',
		'0140' => '007D',
		'0366' => '095F',
		'0365' => '08A2',
		'0A6E' => '0950',
		'0922' => '0934',
		'0838' => '085C',
		'0367' => '0969',
	};
	
	foreach my $key (keys %{$self->{sync_ex_reply}}) { $packets{$key} = ['sync_request_ex']; }
	foreach my $switch (keys %packets) { $self->{packet_list}{$switch} = $packets{$switch}; }
	
	return $self;
}

1;