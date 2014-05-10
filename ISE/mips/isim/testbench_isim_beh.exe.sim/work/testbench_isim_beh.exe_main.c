/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;

char *STD_STANDARD;
char *IEEE_P_1242562249;
char *IEEE_P_3620187407;
char *IEEE_P_3499444699;
char *STD_TEXTIO;
char *IEEE_P_2592010699;


int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    ieee_p_2592010699_init();
    ieee_p_3499444699_init();
    ieee_p_3620187407_init();
    ieee_p_1242562249_init();
    std_textio_init();
    work_a_4084620457_0831356973_init();
    work_a_3002075066_0831356973_init();
    work_a_1208337864_3708392848_init();
    work_a_2251915414_4148422116_init();
    work_a_1153420228_0831356973_init();
    work_a_2110357975_0831356973_init();
    work_a_2046343074_0831356973_init();
    work_a_1111616105_0831356973_init();
    work_a_2421557259_0831356973_init();
    work_a_0424165756_0831356973_init();
    work_a_0832606739_0831356973_init();
    work_a_2399776393_3708392848_init();
    work_a_1430113433_3708392848_init();
    work_a_1130845995_0831356973_init();
    work_a_3720894149_0831356973_init();
    work_a_1335952598_1985558087_init();
    work_a_1949178628_0867315768_init();


    xsi_register_tops("work_a_1949178628_0867315768");

    STD_STANDARD = xsi_get_engine_memory("std_standard");
    IEEE_P_1242562249 = xsi_get_engine_memory("ieee_p_1242562249");
    IEEE_P_3620187407 = xsi_get_engine_memory("ieee_p_3620187407");
    IEEE_P_3499444699 = xsi_get_engine_memory("ieee_p_3499444699");
    STD_TEXTIO = xsi_get_engine_memory("std_textio");
    IEEE_P_2592010699 = xsi_get_engine_memory("ieee_p_2592010699");
    xsi_register_ieee_std_logic_1164(IEEE_P_2592010699);

    return xsi_run_simulation(argc, argv);

}
