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
static const char *ng0 = "C:/Users/tglasser15/Documents/GitHub/bugfree-adventure/ISE/mips_controller.vhd";
extern char *IEEE_P_2592010699;

unsigned char ieee_p_2592010699_sub_1605435078_503743352(char *, unsigned char , unsigned char );
unsigned char ieee_p_2592010699_sub_1690584930_503743352(char *, unsigned char );
unsigned char ieee_p_2592010699_sub_2545490612_503743352(char *, unsigned char , unsigned char );


static void work_a_1208337864_3708392848_p_0(char *t0)
{
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t9;
    char *t10;
    unsigned char t11;
    unsigned char t12;
    char *t13;
    unsigned char t14;
    unsigned char t15;
    char *t16;
    int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned char t21;
    char *t22;
    char *t23;
    unsigned char t24;
    unsigned char t25;
    char *t26;
    unsigned char t27;
    unsigned char t28;
    unsigned char t29;
    unsigned char t30;
    char *t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;

LAB0:    xsi_set_current_line(43, ng0);

LAB3:    t1 = (t0 + 1032U);
    t2 = *((char **)t1);
    t3 = (0 - 5);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t7);
    t9 = (t0 + 2952U);
    t10 = *((char **)t9);
    t11 = *((unsigned char *)t10);
    t12 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t8, t11);
    t9 = (t0 + 1352U);
    t13 = *((char **)t9);
    t14 = *((unsigned char *)t13);
    t15 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t12, t14);
    t9 = (t0 + 1032U);
    t16 = *((char **)t9);
    t17 = (0 - 5);
    t18 = (t17 * -1);
    t19 = (1U * t18);
    t20 = (0 + t19);
    t9 = (t16 + t20);
    t21 = *((unsigned char *)t9);
    t22 = (t0 + 2952U);
    t23 = *((char **)t22);
    t24 = *((unsigned char *)t23);
    t25 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t21, t24);
    t22 = (t0 + 1352U);
    t26 = *((char **)t22);
    t27 = *((unsigned char *)t26);
    t28 = ieee_p_2592010699_sub_1690584930_503743352(IEEE_P_2592010699, t27);
    t29 = ieee_p_2592010699_sub_1605435078_503743352(IEEE_P_2592010699, t25, t28);
    t30 = ieee_p_2592010699_sub_2545490612_503743352(IEEE_P_2592010699, t15, t29);
    t22 = (t0 + 4512);
    t31 = (t22 + 56U);
    t32 = *((char **)t31);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    *((unsigned char *)t34) = t30;
    xsi_driver_first_trans_fast_port(t22);

LAB2:    t35 = (t0 + 4432);
    *((int *)t35) = 1;

LAB1:    return;
LAB4:    goto LAB2;

}


extern void work_a_1208337864_3708392848_init()
{
	static char *pe[] = {(void *)work_a_1208337864_3708392848_p_0};
	xsi_register_didat("work_a_1208337864_3708392848", "isim/top_isim_beh.exe.sim/work/a_1208337864_3708392848.didat");
	xsi_register_executes(pe);
}
