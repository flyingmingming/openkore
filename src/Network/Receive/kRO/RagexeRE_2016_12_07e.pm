#########################################################################
#  OpenKore - Packet Receiveing
#  This module contains functions for Receiveing packets to the server.
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#  Basically, this means that you're allowed to modify and distribute
#  this software. However, if you distribute modified versions, you MUST
#  also distribute the source code.
#  See http://www.gnu.org/licenses/gpl.html for the full license.
########################################################################
# Korea (kRO) #bysctnightcore
# The majority of private servers use eAthena, this is a clone of kRO
package Network::Receive::kRO::RagexeRE_2016_12_07e;

use strict;
use base qw(Network::Receive::kRO::RagexeRE_2016_08_24a);
use I18N qw(bytesToString);
use Globals;

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new(@_);
	
	my %packets = (
		'0AA0' => ['refineui_opened', '' ,[qw()]],
		'0AA2' => ['refineui_info', 'v v C a*' ,[qw(len index bless materials)]],
		'0A37' => ['inventory_item_added', 'a2 v2 C3 a8 V C2 a4 v a25', [qw(ID amount nameID identified broken upgrade cards type_equip type fail expire unknown options)]],
		'0AA5' => ['guild_members_list'],
	);

	foreach my $switch (keys %packets) { $self->{packet_list}{$switch} = $packets{$switch}; }

	return $self;
}

sub guild_members_list {
	my ($self, $args) = @_;

	my ($jobID);
	my $msg = $args->{RAW_MSG};
	my $msg_size = $args->{RAW_MSG_SIZE};
	my $guild_pack = 'a4 V x6 v2 V v x2 V V';
	my $guild_len = length pack $guild_pack;
	my $c = 0;
	my $gtIndex;
	delete $guild{member};
	for (my $i = 4; $i < $msg_size; $i+=$guild_len){
		($guild{member}[$c]{ID},
		$guild{member}[$c]{charID},
		$guild{member}[$c]{jobID},
		$guild{member}[$c]{lv},
		$guild{member}[$c]{contribution},
		$guild{member}[$c]{online},
		$gtIndex,
		$guild{member}[$c]{lastlogin}) = unpack($guild_pack, substr($msg, $i, $guild_len)); # TODO: what are the unknown x's?

		# TODO: we shouldn't store the guildtitle of a guildmember both in $guild{positions} and $guild{member}, instead we should just store the rank index of the guildmember and get the title from the $guild{positions}
		$guild{member}[$c]{title} = $guild{positions}[$gtIndex]{title};
		$guild{member}[$c]{name} = $guild{member}[$c]{charID}; #TODO get member name !! 
		$c++;
	}
}

1;
=pod
// 2016-12-07eRagexeRE
#elif PACKETVER == 20161207
	parseable_packet(0x023b,5,clif_parse_HomMenu,2,4);
	parseable_packet(0x035f,6,clif_parse_TickSend,2);
	parseable_packet(0x0360,6,clif_parse_ReqClickBuyingStore,2);
	parseable_packet(0x0361,19,clif_parse_WantToConnection,2,6,10,14,18);
	parseable_packet(0x0366,90,clif_parse_UseSkillToPosMoreInfo,2,4,6,8,10);
	parseable_packet(0x0368,6,clif_parse_SolveCharName,2);
	parseable_packet(0x0437,5,clif_parse_WalkToXY,2);
	parseable_packet(0x0438,10,clif_parse_UseSkillToPos,2,4,6,8);
	parseable_packet(0x0811,-1,clif_parse_ReqTradeBuyingStore,2,4,8,12);
	parseable_packet(0x0815,-1,clif_parse_ReqOpenBuyingStore,2,4,8,9,89);
	parseable_packet(0x0817,2,clif_parse_ReqCloseBuyingStore,0);
	parseable_packet(0x0819,-1,clif_parse_SearchStoreInfo,2,4,5,9,13,14,15);
	parseable_packet(0x0835,2,clif_parse_SearchStoreInfoNextPage,0);
	parseable_packet(0x0838,12,clif_parse_SearchStoreInfoListItemClick,2,6,10);
	parseable_packet(0x083c,10,clif_parse_UseSkillToId,2,4,6);
	parseable_packet(0x0867,26,clif_parse_FriendsListAdd,2);
	//parseable_packet(0x0868,8,NULL,0); // CZ_JOIN_BATTLE_FIELD
	parseable_packet(0x0875,8,clif_parse_MoveToKafra,2,4);
	parseable_packet(0x087e,-1,clif_parse_ItemListWindowSelected,2,4,8,12);
	parseable_packet(0x0886,7,clif_parse_ActionRequest,2,6);
	parseable_packet(0x08a1,5,clif_parse_ChangeDir,2,4);
	parseable_packet(0x08a2,6,clif_parse_TakeItem,2);
	parseable_packet(0x08ad,6,clif_parse_DropItem,2,4);
	parseable_packet(0x0918,18,clif_parse_PartyBookingRegisterReq,2,4);
	parseable_packet(0x091d,8,clif_parse_MoveFromKafra,2,4);
	//parseable_packet(0x0943,4,NULL,0); // CZ_GANGSI_RANK
	parseable_packet(0x095d,36,clif_parse_StoragePassword,0);
	parseable_packet(0x0965,26,clif_parse_PartyInvite2,2);
	parseable_packet(0x096a,6,clif_parse_GetCharNameRequest,2);
	
	
=cut	
