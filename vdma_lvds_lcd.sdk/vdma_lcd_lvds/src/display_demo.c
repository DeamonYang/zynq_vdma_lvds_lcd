/************************************************************************/
/*																		*/
/*	         display_demo.c	--	HDMI Display demonstration  		   	*/
/*																		*/
/************************************************************************/

/* ------------------------------------------------------------ */
/*				Include File Definitions						*/
/* ------------------------------------------------------------ */

#include <stdio.h>
#include <math.h>
#include <ctype.h>
#include <stdlib.h>
#include "xil_types.h"
#include "xil_cache.h"
#include "xparameters.h"
#include "display_demo.h"
#include "display_ctrl.h"
#include "vga_modes.h"

#include "vdma_config.h"
#include "vtc_config.h"

// Image data for each resolution
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//#include "pic_800_600.h"
//#include "pic_1280_720.h"
//#include "pic_1280_1024.h"
#include "pic_1920_1080.h"
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

/*
 * XPAR redefines
 */
#define XPAR_AXI_DYNCLK_0_BASEADDR 0x43c10000
#define DYNCLK_BASEADDR     XPAR_AXI_DYNCLK_0_BASEADDR
#define VGA_VDMA_ID         XPAR_AXIVDMA_0_DEVICE_ID
#define DISP_VTC_ID         XPAR_VTC_0_DEVICE_ID

/* ------------------------------------------------------------ */
/*				Global Variables								*/
/* ------------------------------------------------------------ */

/*
 * Display Driver struct
 */
DisplayCtrl dispCtrl;
//XAxiVdma vdma;

/*
 * Frame buffers for video data
 */
u8 frameBuf[DISPLAY_NUM_FRAMES][DEMO_MAX_FRAME];
u8 *pFrames[DISPLAY_NUM_FRAMES];  //  array of pointers to the frame buffers


#define MEM_BASE_ADDR		0x10000000
#define BUFFER0_BASE		(MEM_BASE_ADDR)
#define BUFFER1_BASE		(MEM_BASE_ADDR +     IMAGE_WIDTH * IMAGE_HEIGHT * BYTES_PER_PIXEL)
#define BUFFER2_BASE		(MEM_BASE_ADDR + 2 * IMAGE_WIDTH * IMAGE_HEIGHT * BYTES_PER_PIXEL)


u8 *ptempFrames[DISPLAY_NUM_FRAMES] = {(u8*)BUFFER0_BASE,(u8*)BUFFER1_BASE,(u8*)BUFFER2_BASE};

/* ------------------------------------------------------------ */
/*				Procedure Definitions							*/
/* ------------------------------------------------------------ */

int main(void)
{
	int i;
	int Status;
//	XAxiVdma_Config *vdmaConfig;

	xil_printf("VDMA test\r\n");

//	Vtc_init(&Vtc, VTC_DEV_ID, &Vtc_timing, VIDEO_RESOLUTION_WSVGA);



//	Vdma_Setup_Intr_System(&Intc, &AxiVdma, VDMA_INTR_ID);

	/*
	 * Initialize an array of pointers to the 3 frame buffers
	 */
	for (i = 0; i < DISPLAY_NUM_FRAMES; i++)
	{
		pFrames[i] = ptempFrames[i];//frameBuf[i];
	}

	Vdma_Init(&AxiVdma, AXI_VDMA_DEV_ID);

	//Vdma_Start(&AxiVdma);

	/*
	 * Initialize the Display controller and start it
	 */

	// Video Mode for each resolution
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	//VideoMode VMODE = VMODE_800x600;
	//VideoMode VMODE = VMODE_1280x720;
	//VideoMode VMODE = VMODE_1280x1024;
	//VideoMode VMODE = VMODE_1920x1080;
	VideoMode VMODE = VMODE_1366x768;
	//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	Status = DisplayInitialize(&dispCtrl, &AxiVdma, DISP_VTC_ID, DYNCLK_BASEADDR, pFrames, DEMO_STRIDE, VMODE);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Display Ctrl initialization failed during demo initialization%d\r\n", Status);
	}

	Status = DisplayStart(&dispCtrl);
	if (Status != XST_SUCCESS)
	{
		xil_printf("Couldn't start display during demo initialization%d\r\n", Status);
	}

	xil_printf("init ok\r\n");
	//while(1)
	{

		DemoPrintTest(dispCtrl.framePtr[dispCtrl.curFrame], dispCtrl.vMode.width, dispCtrl.vMode.height, dispCtrl.stride);
		xil_printf("update pic data\r\n");
	}


	return 0;
}

void DemoPrintTest(u8 *frame, u32 width, u32 height, u32 stride)
{
	u32 xcoi, ycoi;
	u32 linesStart = 0;
	u32 pixelIdx = 0;

	//u8 vdma_pic_data

	for(ycoi = 0; ycoi < height; ycoi++)
	{
		for(xcoi = 0; xcoi < (width * 4); xcoi+=4)
		{

			//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

			/*
			// 800 x 600
			frame[linesStart + xcoi    ] = Pixel_800_600[pixelIdx++];  // Blue
			frame[linesStart + xcoi + 1] = Pixel_800_600[pixelIdx++];  // Green
			frame[linesStart + xcoi + 2] = Pixel_800_600[pixelIdx++];  // Red
			*/


			// 1280 x 720
//			frame[linesStart + xcoi    ] = Pixel_1280_720[pixelIdx++];
//			frame[linesStart + xcoi + 1] = Pixel_1280_720[pixelIdx++];
//			frame[linesStart + xcoi + 2] = Pixel_1280_720[pixelIdx++];


			/*
			// 1280 x 1024
			frame[linesStart + xcoi    ] = Pixel_1280_1024[pixelIdx++];
			frame[linesStart + xcoi + 1] = Pixel_1280_1024[pixelIdx++];
			frame[linesStart + xcoi + 2] = Pixel_1280_1024[pixelIdx++];
			*/

			// 1920 x 1080
			frame[linesStart + xcoi    ] = 255-ycoi;//Pixel_1920_1080[pixelIdx++];
			frame[linesStart + xcoi + 1] = ycoi;//Pixel_1920_1080[pixelIdx++];
			frame[linesStart + xcoi + 2] = ycoi;//Pixel_1920_1080[pixelIdx++];

			//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
		}

		linesStart += stride;
	}

	/*
	 * Flush the frame buffer memory range to ensure changes are written to the
	 * actual memory, and therefore accessible by the VDMA.
	 */
	Xil_DCacheFlushRange((unsigned int) frame, DEMO_MAX_FRAME);
}


