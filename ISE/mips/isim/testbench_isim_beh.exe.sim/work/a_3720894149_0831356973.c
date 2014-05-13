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
static const char *ng0 = "C:/Users/tglasser15/Documents/GitHub/bugfree-adventure/ISE/mips_mem.vhd";
extern char *IEEE_P_3620187407;
extern char *IEEE_P_1242562249;

int ieee_p_1242562249_sub_1657552908_1035706684(char *, char *, char *);


static void work_a_3720894149_0831356973_p_0(char *t0)
{
    char t14[16];
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
    char *t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    int t28;
    int t29;
    unsigned int t30;
    unsigned int t31;

LAB0:    xsi_set_current_line(25, ng0);
    t2 = (t0 + 992U);
    t3 = xsi_signal_has_event(t2);
    if (t3 == 1)
        goto LAB5;

LAB6:    t1 = (unsigned char)0;

LAB7:    if (t1 != 0)
        goto LAB2;

LAB4:
LAB3:    xsi_set_current_line(34, ng0);
    t2 = (t0 + 1672U);
    t4 = *((char **)t2);
    t2 = (t0 + 6316U);
    t5 = (t0 + 8582);
    t11 = (t14 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 0;
    t12 = (t11 + 4U);
    *((int *)t12) = 31;
    t12 = (t11 + 8U);
    *((int *)t12) = 1;
    t17 = (31 - 0);
    t18 = (t17 * 1);
    t18 = (t18 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t18;
    t1 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t4, t2, t5, t14);
    if (t1 != 0)
        goto LAB14;

LAB16:    xsi_set_current_line(37, ng0);
    t2 = (t0 + 2288U);
    t4 = *((char **)t2);
    t2 = (t0 + 1672U);
    t5 = *((char **)t2);
    t18 = (31 - 7);
    t25 = (t18 * 1U);
    t26 = (0 + t25);
    t2 = (t5 + t26);
    t8 = (t14 + 0U);
    t11 = (t8 + 0U);
    *((int *)t11) = 7;
    t11 = (t8 + 4U);
    *((int *)t11) = 2;
    t11 = (t8 + 8U);
    *((int *)t11) = -1;
    t17 = (2 - 7);
    t27 = (t17 * -1);
    t27 = (t27 + 1);
    t11 = (t8 + 12U);
    *((unsigned int *)t11) = t27;
    t28 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t14);
    t29 = (t28 - 63);
    t27 = (t29 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t28);
    t30 = (32U * t27);
    t31 = (0 + t30);
    t11 = (t4 + t31);
    t12 = (t0 + 3736);
    t13 = (t12 + 56U);
    t15 = *((char **)t13);
    t16 = (t15 + 56U);
    t20 = *((char **)t16);
    memcpy(t20, t11, 32U);
    xsi_driver_first_trans_fast_port(t12);

LAB15:    t2 = (t0 + 3592);
    *((int *)t2) = 1;

LAB1:    return;
LAB2:    xsi_set_current_line(26, ng0);
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

LAB8:    xsi_set_current_line(27, ng0);
    t4 = (t0 + 1672U);
    t11 = *((char **)t4);
    t4 = (t0 + 6316U);
    t12 = (t0 + 8550);
    t15 = (t14 + 0U);
    t16 = (t15 + 0U);
    *((int *)t16) = 0;
    t16 = (t15 + 4U);
    *((int *)t16) = 31;
    t16 = (t15 + 8U);
    *((int *)t16) = 1;
    t17 = (31 - 0);
    t18 = (t17 * 1);
    t18 = (t18 + 1);
    t16 = (t15 + 12U);
    *((unsigned int *)t16) = t18;
    t19 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t11, t4, t12, t14);
    if (t19 != 0)
        goto LAB11;

LAB13:    xsi_set_current_line(30, ng0);
    t2 = (t0 + 1832U);
    t4 = *((char **)t2);
    t2 = (t0 + 2288U);
    t5 = *((char **)t2);
    t2 = (t0 + 1672U);
    t8 = *((char **)t2);
    t18 = (31 - 7);
    t25 = (t18 * 1U);
    t26 = (0 + t25);
    t2 = (t8 + t26);
    t11 = (t14 + 0U);
    t12 = (t11 + 0U);
    *((int *)t12) = 7;
    t12 = (t11 + 4U);
    *((int *)t12) = 2;
    t12 = (t11 + 8U);
    *((int *)t12) = -1;
    t17 = (2 - 7);
    t27 = (t17 * -1);
    t27 = (t27 + 1);
    t12 = (t11 + 12U);
    *((unsigned int *)t12) = t27;
    t28 = ieee_p_1242562249_sub_1657552908_1035706684(IEEE_P_1242562249, t2, t14);
    t29 = (t28 - 63);
    t27 = (t29 * -1);
    xsi_vhdl_check_range_of_index(63, 0, -1, t28);
    t30 = (32U * t27);
    t31 = (0 + t30);
    t12 = (t5 + t31);
    memcpy(t12, t4, 32U);

LAB12:    goto LAB9;

LAB11:    xsi_set_current_line(28, ng0);
    t16 = (t0 + 1832U);
    t20 = *((char **)t16);
    t16 = (t0 + 3672);
    t21 = (t16 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t20, 32U);
    xsi_driver_first_trans_fast_port(t16);
    goto LAB12;

LAB14:    xsi_set_current_line(35, ng0);
    t12 = (t0 + 1352U);
    t13 = *((char **)t12);
    t12 = (t0 + 3736);
    t15 = (t12 + 56U);
    t16 = *((char **)t15);
    t20 = (t16 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t13, 32U);
    xsi_driver_first_trans_fast_port(t12);
    goto LAB15;

}


extern void work_a_3720894149_0831356973_init()
{
	static char *pe[] = {(void *)work_a_3720894149_0831356973_p_0};
	xsi_register_didat("work_a_3720894149_0831356973", "isim/testbench_isim_beh.exe.sim/work/a_3720894149_0831356973.didat");
	xsi_register_executes(pe);
}
