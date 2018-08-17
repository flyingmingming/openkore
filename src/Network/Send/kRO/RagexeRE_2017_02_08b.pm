#########################################################################
#  OpenKore - Packet sending
#  This module contains functions for sending packets to the server.
#
#  This software is open source, licensed under the GNU General Public
#  License, version 2.
#  Basically, this means that you're allowed to modify and distribute
#  this software. However, if you distribute modified versions, you MUST
#  also distribute the source code.
#  See http://www.gnu.org/licenses/gpl.html for the full license.
########################################################################

package Network::Send::kRO::RagexeRE_2017_02_08b;

use strict;
use base qw(Network::Send::kRO::RagexeRE_2017_02_01a);

sub new {
	my ($class) = @_;
	my $self = $class->SUPER::new(@_);
	
	my %packets = (
		'0369' => ['actor_action', 'a4 C', [qw(targetID type)]],
		'096A' => ['actor_info_request', 'a4', [qw(ID)]],
		'0860' => ['actor_look_at', 'v C', [qw(head body)]],
		'0368' => ['actor_name_request', 'a4', [qw(ID)]],
		'0811' => ['buy_bulk_buyer', 'a4 a4 a*', [qw(buyerID buyingStoreID itemInfo)]], #Buying store
		'0817' => ['buy_bulk_closeShop'],			
		'0815' => ['buy_bulk_openShop', 'v V C Z80 a*', [qw(len limitZeny result storeName itemInfo)]], # Buying store
		'0360' => ['buy_bulk_request', 'a4', [qw(ID)]], #6
		'0437' => ['character_move', 'a3', [qw(coordString)]],
		'0892' => ['friend_request', 'a*', [qw(username)]],# len 26
		'092D' => ['homunculus_command', 'v C', [qw(commandType, commandID)]],
		'0921' => ['item_drop', 'a2 v', [qw(ID amount)]],
		'0367' => ['item_list_window_selected', 'v V V a*', [qw(len type act itemInfo)]],
		'0923' => ['item_take', 'a4', [qw(ID)]],
		'088C' => ['map_login', 'a4 a4 a4 V C', [qw(accountID charID sessionID tick sex)]],
		'085C' => ['party_join_request_by_name', 'Z24', [qw(partyName)]],
		'083C' => ['skill_use', 'v2 a4', [qw(lv skillID targetID)]],
		'0438' => ['skill_use_location', 'v4', [qw(lv skillID x y)]],
		'08AC' => ['storage_item_add', 'a2 V', [qw(ID amount)]],
		'0932' => ['storage_item_remove', 'a2 V', [qw(ID amount)]],
		'0937' => ['storage_password'],
		'035F' => ['sync', 'V', [qw(time)]],		
		'0819' => ['search_store_info', 'v C V2 C2 a*', [qw(len type max_price min_price item_count card_count item_card_list)]],
		'0835' => ['search_store_request_next_page'],
		'0838' => ['search_store_select', 'a4 a4 v', [qw(accountID storeID nameID)]],
	);
	
	$self->{packet_list}{$_} = $packets{$_} for keys %packets;
	
	my %handlers = qw(
		actor_action 0369
		actor_info_request 096A
		actor_look_at 0860
		actor_name_request 0368
		buy_bulk_buyer 0811
		buy_bulk_closeShop 0817
		buy_bulk_openShop 0815
		buy_bulk_request 0360
		character_move 0437
		friend_request 0892
		homunculus_command 092D
		item_drop 0921
		item_list_window_selected 0367
		item_take 0923
		map_login 088C
		party_join_request_by_name 085C
		skill_use 083C
		skill_use_location 0438
		storage_item_add 08AC
		storage_item_remove 0932
		storage_password 0937
		sync 035F
		search_store_info 0819
		search_store_request_next_page 0835
		search_store_select 0838
	);
	
	
	$self->{packet_lut}{$_} = $handlers{$_} for keys %handlers;
#	#elif PACKETVER == 20170208 // 2017-02-08aRagexeRE
#	packet_keys(0x6A764E5F,0x0609570D,0x28AE07FA);
#	$self->cryptKeys(0x6A764E5F,0x28AE07FA,0x0609570D);


	return $self;
}

1;
