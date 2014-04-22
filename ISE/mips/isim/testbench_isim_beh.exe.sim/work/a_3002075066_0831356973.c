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
static const char *ng0 = "//cs1/cs_students/mlindahl15/CS475/MIPS_CPU_FPGA_AND_SIM_V4/mips_decoder_alu.vhd";



static void work_a_3002075066_0831356973_p_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    int t4;
    char *t5;
    char *t6;
    int t7;
    char *t8;
    char *t9;
    int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    int t18;
    int t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(14, ng0);
    t1 = (t0 + 1192U);
    t2 = *((char **)t1);
    t1 = (t0 + 5054);
    t4 = xsi_mem_cmp(t1, t2, 2U);
    if (t4 == 1)
        goto LAB3;

LAB7:    t5 = (t0 + 5056);
    t7 = xsi_mem_cmp(t5, t2, 2U);
    if (t7 == 1)
        goto LAB4;

LAB8:    t8 = (t0 + 5058);
    t10 = xsi_mem_cmp(t8, t2, 2U);
    if (t10 == 1)
        goto LAB5;

LAB9:
LAB6:    xsi_set_current_line(29, ng0);
    t1 = (t0 + 5132);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);

LAB2:    t1 = (t0 + 2992);
    *((int *)t1) = 1;

LAB1:    return;
LAB3:    xsi_set_current_line(15, ng0);
    t11 = (t0 + 5060);
    t13 = (t0 + 3072);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    memcpy(t17, t11, 3U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB2;

LAB4:    xsi_set_current_line(16, ng0);
    t1 = (t0 + 5063);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB2;

LAB5:    xsi_set_current_line(17, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 5066);
    t4 = xsi_mem_cmp(t1, t2, 6U);
    if (t4 == 1)
        goto LAB12;

LAB15:    t5 = (t0 + 5072);
    t7 = xsi_mem_cmp(t5, t2, 6U);
    if (t7 == 1)
        goto LAB13;

LAB16:
LAB14:    xsi_set_current_line(27, ng0);
    t1 = (t0 + 5129);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);

LAB11:    goto LAB2;

LAB10:;
LAB12:    xsi_set_current_line(18, ng0);
    t8 = (t0 + 5078);
    t11 = (t0 + 3072);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t8, 3U);
    xsi_driver_first_trans_fast_port(t11);
    goto LAB11;

LAB13:    xsi_set_current_line(19, ng0);
    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t1 = (t0 + 5081);
    t4 = xsi_mem_cmp(t1, t2, 6U);
    if (t4 == 1)
        goto LAB19;

LAB25:    t5 = (t0 + 5087);
    t7 = xsi_mem_cmp(t5, t2, 6U);
    if (t7 == 1)
        goto LAB20;

LAB26:    t8 = (t0 + 5093);
    t10 = xsi_mem_cmp(t8, t2, 6U);
    if (t10 == 1)
        goto LAB21;

LAB27:    t11 = (t0 + 5099);
    t18 = xsi_mem_cmp(t11, t2, 6U);
    if (t18 == 1)
        goto LAB22;

LAB28:    t13 = (t0 + 5105);
    t19 = xsi_mem_cmp(t13, t2, 6U);
    if (t19 == 1)
        goto LAB23;

LAB29:
LAB24:    xsi_set_current_line(25, ng0);
    t1 = (t0 + 5126);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);

LAB18:    goto LAB11;

LAB17:;
LAB19:    xsi_set_current_line(20, ng0);
    t15 = (t0 + 5111);
    t17 = (t0 + 3072);
    t20 = (t17 + 56U);
    t21 = *((char **)t20);
    t22 = (t21 + 56U);
    t23 = *((char **)t22);
    memcpy(t23, t15, 3U);
    xsi_driver_first_trans_fast_port(t17);
    goto LAB18;

LAB20:    xsi_set_current_line(21, ng0);
    t1 = (t0 + 5114);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB18;

LAB21:    xsi_set_current_line(22, ng0);
    t1 = (t0 + 5117);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB18;

LAB22:    xsi_set_current_line(23, ng0);
    t1 = (t0 + 5120);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB18;

LAB23:    xsi_set_current_line(24, ng0);
    t1 = (t0 + 5123);
    t3 = (t0 + 3072);
    t5 = (t3 + 56U);
    t6 = *((char **)t5);
    t8 = (t6 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t1, 3U);
    xsi_driver_first_trans_fast_port(t3);
    goto LAB18;

LAB30:;
}


extern void work_a_3002075066_0831356973_init()
{
	static char *pe[] = {(void *)work_a_3002075066_0831356973_p_0};
	xsi_register_didat("work_a_3002075066_0831356973", "isim/testbench_isim_beh.exe.sim/work/a_3002075066_0831356973.didat");
	xsi_register_executes(pe);
}
