
#include <gb/gb.h>
#include <gbt_player.h>

extern const unsigned char * song_Data[];

void main()
{
	disable_interrupts();
	
	gbt_play(song_Data, 2, 7);
	gbt_loop(1);

	set_interrupts(VBL_IFLAG);
	enable_interrupts();

	UINT8 stopped = 0;
	UINT8 joylast = 0;

	while(1)
	{
		UINT8 joydata = joypad();
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
