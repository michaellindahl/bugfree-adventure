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
static const char *ng0 = "C:/Users/mlindahl15/Documents/GitHub/bugfree-adventure/ISE/mips_building_blocks.vhd";
extern char *IEEE_P_2592010699;



static void work_a_0424165756_0831356973_p_0(char *t0)
{
    char t17[16];
    char t19[16];
    char t34[16];
    char t36[16];
    unsigned char t1;
    char *t2;
    char *t3;
    int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned int t7;
    unsigned char t8;
    unsigned char t9;
    char *t10;
    char *t11;
    unsigned char t12;
    unsigned char t13;
    char *t15;
    char *t16;
    char *t18;
    char *t20;
    char *t21;
    int t22;
    unsigned int t23;
    unsigned char t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    char *t32;
    char *t33;
    char *t35;
    char *t37;
    char *t38;
    int t39;
    unsigned int t40;
    unsigned char t41;
    char *t42;
    char *t43;
    char *t44;
    char *t45;
    char *t46;
    char *t47;

LAB0:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t4 = (15 - 15);
    t5 = (t4 * -1);
    t6 = (1U * t5);
    t7 = (0 + t6);
    t2 = (t3 + t7);
    t8 = *((unsigned char *)t2);
    t9 = (t8 == (unsigned char)2);
    if (t9 == 1)
        goto LAB5;

LAB6:    t10 = (t0 + 1352U);
    t11 = *((char **)t10);
    t12 = *((unsigned char *)t11);
    t13 = (t12 == (unsigned char)3);
    t1 = t13;

LAB7:    if (t1 != 0)
        goto LAB3;

LAB4:
LAB10:    t30 = (t0 + 4757);
    t32 = (t0 + 1032U);
    t33 = *((char **)t32);
    t35 = ((IEEE_P_2592010699) + 4024);
    t37 = (t36 + 0U);
    t38 = (t37 + 0U);
    *((int *)t38) = 0;
    t38 = (t37 + 4U);
    *((int *)t38) = 15;
    t38 = (t37 + 8U);
    *((int *)t38) = 1;
    t39 = (15 - 0);
    t40 = (t39 * 1);
    t40 = (t40 + 1);
    t38 = (t37 + 12U);
    *((unsigned int *)t38) = t40;
    t38 = (t0 + 4684U);
    t32 = xsi_base_array_concat(t32, t34, t35, (char)97, t30, t36, (char)97, t33, t38, (char)101);
    t40 = (16U + 16U);
    t41 = (32U != t40);
    if (t41 == 1)
        goto LAB12;

LAB13:    t42 = (t0 + 2912);
    t43 = (t42 + 56U);
    t44 = *((char **)t43);
    t45 = (t44 + 56U);
    t46 = *((char **)t45);
    memcpy(t46, t32, 32U);
    xsi_driver_first_trans_fast_port(t42);

LAB2:    t47 = (t0 + 2832);
    *((int *)t47) = 1;

LAB1:    return;
LAB3:    t10 = (t0 + 4741);
    t15 = (t0 + 1032U);
    t16 = *((char **)t15);
    t18 = ((IEEE_P_2592010699) + 4024);
    t20 = (t19 + 0U);
    t21 = (t20 + 0U);
    *((int *)t21) = 0;
    t21 = (t20 + 4U);
    *((int *)t21) = 15;
    t21 = (t20 + 8U);
    *((int *)t21) = 1;
    t22 = (15 - 0);
    t23 = (t22 * 1);
    t23 = (t23 + 1);
    t21 = (t20 + 12U);
    *((unsigned int *)t21) = t23;
    t21 = (t0 + 4684U);
    t15 = xsi_base_array_concat(t15, t17, t18, (char)97, t10, t19, (char)97, t16, t21, (char)101);
    t23 = (16U + 16U);
    t24 = (32U != t23);
    if (t24 == 1)
        goto LAB8;

LAB9:    t25 = (t0 + 2912);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    t28 = (t27 + 56U);
    t29 = *((char **)t28);
    memcpy(t29, t15, 32U);
    xsi_driver_first_trans_fast_port(t25);
    goto LAB2;

LAB5:    t1 = (unsigned char)1;
    goto LAB7;

LAB8:    xsi_size_not_matching(32U, t23, 0);
    goto LAB9;

LAB11:    goto LAB2;

LAB12:    xsi_size_not_matching(32U, t40, 0);
    goto LAB13;

}


extern void work_a_0424165756_0831356973_init()
{
	static char *pe[] = {(void *)work_a_0424165756_0831356973_p_0};
	xsi_register_didat("work_a_0424165756_0831356973", "isim/testbench_isim_beh.exe.sim/work/a_0424165756_0831356973.didat");
	xsi_register_executes(pe);
}
