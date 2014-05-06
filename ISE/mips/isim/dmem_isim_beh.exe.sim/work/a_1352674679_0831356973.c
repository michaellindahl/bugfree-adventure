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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/jburge16/Documents/GitHub/bugfree-adventure/ISE/mips_mem.vhd";
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_1352674679_0831356973_p_0(char *t0)
{
    char t17[16];
    unsigned char t1;
    char *t2;
    unsigned char t3;
    char *t4;
    char *t5;
    unsigned char t6;
    unsigned char t7;
    char *t8;
    unsigned char t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    char *t18;
    char *t19;
    int t20;
    unsigned int t21;
    int t22;
    int t23;
    unsigned int t24;
    unsigned int t25;
    char *t26;

LAB0:    xsi_set_current_line(23, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(27, ng0);
    t2 = (t0 + 1968U);
    t4 = *((char **)t2);
    t2 = (t0 + 1352U);
    t5 = *((char **)t2);
    t14 = (31 - 7);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t2 = (t5 + t16);
    t8 = (t17 + 0U);
    t11 = (t8 + 0U);
    *((int *)t11) = 7;
    t11 = (t8 + 4U);
    *((int *)t11) = 2;
    t11 = (t8 + 8U);
    *((int *)t11) = -1;
    t20 = (2 - 7);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t11 = (t8 + 12U);
    *((unsigned int *)t11) = t21;
    t22 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t17);
    t23 = (t22 - 63);
    t21 = (t23 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t22);
    t24 = (32U * t21);
    t25 = (0 + t24);
    t11 = (t4 + t25);
    t12 = (t0 + 3352);
    t13 = (t12 + 56U);
    t18 = *((char **)t13);
    t19 = (t18 + 56U);
    t26 = *((char **)t19);
    memcpy(t26, t11, 32U);
    xsi_driver_first_trans_fast_port(t12);
    t2 = (t0 + 3272);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(24, ng0);
    t4 = (t0 + 1192U);
    t8 = *((char **)t4);
    t9 = *((unsigned char *)t8);
    t10 = (t9 == (unsigned char)3);
    if (t10 != 0)
        goto LAB8;

LAB10:
LAB9:    goto LAB3;

LAB5:    t4 = (t0 + 1032U);
    t5 = *((char **)t4);
    t6 = *((unsigned char *)t5);
    t7 = (t6 == (unsigned char)3);
    t1 = t7;
    goto LAB7;

LAB8:    xsi_set_current_line(24, ng0);
    t4 = (t0 + 1512U);
    t11 = *((char **)t4);
    t4 = (t0 + 1968U);
    t12 = *((char **)t4);
    t4 = (t0 + 1352U);
    t13 = *((char **)t4);
    t14 = (31 - 7);
    t15 = (t14 * 1U);
    t16 = (0 + t15);
    t4 = (t13 + t16);
    t18 = (t17 + 0U);
    t19 = (t18 + 0U);
    *((int *)t19) = 7;
    t19 = (t18 + 4U);
    *((int *)t19) = 2;
    t19 = (t18 + 8U);
    *((int *)t19) = -1;
    t20 = (2 - 7);
    t21 = (t20 * -1);
    t21 = (t21 + 1);
    t19 = (t18 + 12U);
    *((unsigned int *)t19) = t21;
    t22 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t4, t17);
    t23 = (t22 - 63);
    t21 = (t23 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t22);
    t24 = (32U * t21);
    t25 = (0 + t24);
    t19 = (t12 + t25);
    memcpy(t19, t11, 32U);
    goto LAB9;

}


extern void work_a_1352674679_0831356973_init()
{
	static char *pe[] = {(void *)work_a_1352674679_0831356973_p_0};
	xsi_register_didat("work_a_1352674679_0831356973", "isim/dmem_isim_beh.exe.sim/work/a_1352674679_0831356973.didat");
	xsi_register_executes(pe);
}
