
#include <gb/gb.h>
#include <gbt_player.h>

extern const unsigned char *song_Data[];
BANKREF_EXTERN(song_Data_bank)


void main()
{
	NR52_REG = 0x80;
	NR51_REG = 0xFF;
	NR50_REG = 0x77;
	disable_interrupts();
	
	//SWITCH_ROM( BANK(song_Data_bank) );

    gbt_play(song_Data, 2, 7);


	gbt_loop(1);

	set_interrupts(VBL_IFLAG);
	enable_interrupts();

	uint8_t stopped = 0;
	uint8_t joylast = 0;

	while(1)
	{
		uint8_t joydata = joypad();
		if (joydata & J_START && !(joylast & J_START))
		{
			if (stopped)
				gbt_play(song_Data, 2, 7);
			else
				gbt_stop();
			stopped = !stopped;
		}

		joylast = joydata;

		wait_vbl_done();
		gbt_update(); // This will change to ROM bank 1.
	}
}
