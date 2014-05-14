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
static const char *ng0 = "C:/Users/mlindahl15/Documents/GitHub/bugfree-adventure/ISE/mips_alu.vhd";
extern char *IEEE_P_2592010699;
extern char *IEEE_P_3620187407;

char *ieee_p_2592010699_sub_1306069469_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1697423399_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1735675855_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_2592010699_sub_1837678034_503743352(char *, char *, char *, char *);
char *ieee_p_2592010699_sub_795620321_503743352(char *, char *, char *, char *, char *, char *);
char *ieee_p_3620187407_sub_674691591_3965413181(char *, char *, char *, char *, unsigned char );
char *ieee_p_3620187407_sub_767668596_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_0832606739_0831356973_p_0(char *t0)
{
    char t9[16];
    char *t1;
    char *t2;
    int t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    unsigned char t7;
    unsigned char t8;
    char *t10;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned char t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;

LAB0:    xsi_set_current_line(15, ng0);
    t1 = (t0 + 1352U);
    t2 = *((char **)t1);
    t3 = (3 - 3);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB7:    t22 = (t0 + 1192U);
    t23 = *((char **)t22);
    t22 = (t0 + 4768);
    t24 = (t22 + 56U);
    t25 = *((char **)t24);
    t26 = (t25 + 56U);
    t27 = *((char **)t26);
    memcpy(t27, t23, 32U);
    xsi_driver_first_trans_fast(t22);

LAB2:    t28 = (t0 + 4624);
    *((int *)t28) = 1;

LAB1:    return;
LAB3:    t10 = (t0 + 1192U);
    t11 = *((char **)t10);
    t10 = (t0 + 7480U);
    t12 = ieee_p_2592010699_sub_1837678034_503743352(IEEE_P_2592010699, t9, t11, t10);
    t13 = (t9 + 12U);
    t14 = *((unsigned int *)t13);
    t15 = (1U * t14);
    t16 = (32U != t15);
    if (t16 == 1)
        goto LAB5;

LAB6:    t17 = (t0 + 4768);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    t20 = (t19 + 56U);
    t21 = *((char **)t20);
    memcpy(t21, t12, 32U);
    xsi_driver_first_trans_fast(t17);
    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t15, 0);
    goto LAB6;

LAB8:    goto LAB2;

}

static void work_a_0832606739_0831356973_p_1(char *t0)
{
    char t1[16];
    char t2[16];
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned char t14;
    char *t15;
    char *t16;
    unsigned int t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;

LAB0:    xsi_set_current_line(16, ng0);

LAB3:    t3 = (t0 + 1032U);
    t4 = *((char **)t3);
    t3 = (t0 + 7464U);
    t5 = (t0 + 1832U);
    t6 = *((char **)t5);
    t5 = (t0 + 7528U);
    t7 = ieee_p_3620187407_sub_767668596_3965413181(IEEE_P_3620187407, t2, t4, t3, t6, t5);
    t8 = (t0 + 1352U);
    t9 = *((char **)t8);
    t10 = (3 - 3);
    t11 = (t10 * -1);
    t12 = (1U * t11);
    t13 = (0 + t12);
    t8 = (t9 + t13);
    t14 = *((unsigned char *)t8);
    t15 = ieee_p_3620187407_sub_674691591_3965413181(IEEE_P_3620187407, t1, t7, t2, t14);
    t16 = (t1 + 12U);
    t17 = *((unsigned int *)t16);
    t18 = (1U * t17);
    t19 = (32U != t18);
    if (t19 == 1)
        goto LAB5;

LAB6:    t20 = (t0 + 4832);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t15, 32U);
    xsi_driver_first_trans_fast(t20);

LAB2:    t25 = (t0 + 4640);
    *((int *)t25) = 1;

LAB1:    return;
LAB4:    goto LAB2;

LAB5:    xsi_size_not_matching(32U, t18, 0);
    goto LAB6;

}

static void work_a_0832606739_0831356973_p_2(char *t0)
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
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;

LAB0:    xsi_set_current_line(18, ng0);
    t1 = (t0 + 1992U);
    t2 = *((char **)t1);
    t3 = (31 - 31);
    t4 = (t3 * -1);
    t5 = (1U * t4);
    t6 = (0 + t5);
    t1 = (t2 + t6);
    t7 = *((unsigned char *)t1);
    t8 = (t7 == (unsigned char)3);
    if (t8 != 0)
        goto LAB3;

LAB4:
LAB5:    t16 = (t0 + 7748);
    t18 = (t0 + 4896);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    memcpy(t22, t16, 32U);
    xsi_driver_first_trans_fast(t18);

LAB2:    t23 = (t0 + 4656);
    *((int *)t23) = 1;

LAB1:    return;
LAB3:    t9 = (t0 + 7716);
    t11 = (t0 + 4896);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = (t13 + 56U);
    t15 = *((char **)t14);
    memcpy(t15, t9, 32U);
    xsi_driver_first_trans_fast(t11);
    goto LAB2;

LAB6:    goto LAB2;

}

static void work_a_0832606739_0831356973_p_3(char *t0)
{
    char t22[16];
    char *t1;
    char *t2;
    char *t3;
    unsigned int t4;
    unsigned int t5;
    unsigned int t6;
    char *t7;
    char *t8;
    int t9;
    char *t10;
    char *t11;
    int t12;
    char *t13;
    char *t14;
    int t15;
    char *t16;
    char *t17;
    int t18;
    char *t19;
    int t21;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    unsigned char t31;
    char *t32;
    char *t33;
    char *t34;
    char *t35;
    char *t36;

LAB0:    t1 = (t0 + 4056U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(19, ng0);
    t2 = (t0 + 1352U);
    t3 = *((char **)t2);
    t4 = (3 - 2);
    t5 = (t4 * 1U);
    t6 = (0 + t5);
    t2 = (t3 + t6);
    t7 = (t0 + 7780);
    t9 = xsi_mem_cmp(t7, t2, 3U);
    if (t9 == 1)
        goto LAB5;

LAB11:    t10 = (t0 + 7783);
    t12 = xsi_mem_cmp(t10, t2, 3U);
    if (t12 == 1)
        goto LAB6;

LAB12:    t13 = (t0 + 7786);
    t15 = xsi_mem_cmp(t13, t2, 3U);
    if (t15 == 1)
        goto LAB7;

LAB13:    t16 = (t0 + 7789);
    t18 = xsi_mem_cmp(t16, t2, 3U);
    if (t18 == 1)
        goto LAB8;

LAB14:    t19 = (t0 + 7792);
    t21 = xsi_mem_cmp(t19, t2, 3U);
    if (t21 == 1)
        goto LAB9;

LAB15:
LAB10:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 2152U);
    t3 = *((char **)t2);
    t2 = (t0 + 4960);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);

LAB4:    xsi_set_current_line(19, ng0);

LAB27:    t2 = (t0 + 4672);
    *((int *)t2) = 1;
    *((char **)t1) = &&LAB28;

LAB1:    return;
LAB5:    xsi_set_current_line(20, ng0);
    t23 = (t0 + 1032U);
    t24 = *((char **)t23);
    t23 = (t0 + 7464U);
    t25 = (t0 + 1832U);
    t26 = *((char **)t25);
    t25 = (t0 + 7528U);
    t27 = ieee_p_2592010699_sub_795620321_503743352(IEEE_P_2592010699, t22, t24, t23, t26, t25);
    t28 = (t22 + 12U);
    t29 = *((unsigned int *)t28);
    t30 = (1U * t29);
    t31 = (32U != t30);
    if (t31 == 1)
        goto LAB17;

LAB18:    t32 = (t0 + 4960);
    t33 = (t32 + 56U);
    t34 = *((char **)t33);
    t35 = (t34 + 56U);
    t36 = *((char **)t35);
    memcpy(t36, t27, 32U);
    xsi_driver_first_trans_fast_port(t32);
    goto LAB4;

LAB6:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 7464U);
    t7 = (t0 + 1832U);
    t8 = *((char **)t7);
    t7 = (t0 + 7528U);
    t10 = ieee_p_2592010699_sub_1735675855_503743352(IEEE_P_2592010699, t22, t3, t2, t8, t7);
    t11 = (t22 + 12U);
    t4 = *((unsigned int *)t11);
    t5 = (1U * t4);
    t31 = (32U != t5);
    if (t31 == 1)
        goto LAB19;

LAB20:    t13 = (t0 + 4960);
    t14 = (t13 + 56U);
    t16 = *((char **)t14);
    t17 = (t16 + 56U);
    t19 = *((char **)t17);
    memcpy(t19, t10, 32U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB4;

LAB7:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 1992U);
    t3 = *((char **)t2);
    t2 = (t0 + 4960);
    t7 = (t2 + 56U);
    t8 = *((char **)t7);
    t10 = (t8 + 56U);
    t11 = *((char **)t10);
    memcpy(t11, t3, 32U);
    xsi_driver_first_trans_fast_port(t2);
    goto LAB4;

LAB8:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 7464U);
    t7 = (t0 + 1832U);
    t8 = *((char **)t7);
    t7 = (t0 + 7528U);
    t10 = ieee_p_2592010699_sub_1306069469_503743352(IEEE_P_2592010699, t22, t3, t2, t8, t7);
    t11 = (t22 + 12U);
    t4 = *((unsigned int *)t11);
    t5 = (1U * t4);
    t31 = (32U != t5);
    if (t31 == 1)
        goto LAB21;

LAB22:    t13 = (t0 + 4960);
    t14 = (t13 + 56U);
    t16 = *((char **)t14);
    t17 = (t16 + 56U);
    t19 = *((char **)t17);
    memcpy(t19, t10, 32U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB4;

LAB9:    xsi_set_current_line(20, ng0);
    t2 = (t0 + 1032U);
    t3 = *((char **)t2);
    t2 = (t0 + 7464U);
    t7 = (t0 + 1832U);
    t8 = *((char **)t7);
    t7 = (t0 + 7528U);
    t10 = ieee_p_2592010699_sub_1697423399_503743352(IEEE_P_2592010699, t22, t3, t2, t8, t7);
    t11 = (t22 + 12U);
    t4 = *((unsigned int *)t11);
    t5 = (1U * t4);
    t31 = (32U != t5);
    if (t31 == 1)
        goto LAB23;

LAB24:    t13 = (t0 + 4960);
    t14 = (t13 + 56U);
    t16 = *((char **)t14);
    t17 = (t16 + 56U);
    t19 = *((char **)t17);
    memcpy(t19, t10, 32U);
    xsi_driver_first_trans_fast_port(t13);
    goto LAB4;

LAB16:;
LAB17:    xsi_size_not_matching(32U, t30, 0);
    goto LAB18;

LAB19:    xsi_size_not_matching(32U, t5, 0);
    goto LAB20;

LAB21:    xsi_size_not_matching(32U, t5, 0);
    goto LAB22;

LAB23:    xsi_size_not_matching(32U, t5, 0);
    goto LAB24;

LAB25:    t3 = (t0 + 4672);
    *((int *)t3) = 0;
    goto LAB2;

LAB26:    goto LAB25;

LAB28:    goto LAB26;

}

static void work_a_0832606739_0831356973_p_4(char *t0)
{
    char t5[16];
    char *t1;
    char *t2;
    char *t3;
    char *t6;
    char *t7;
    int t8;
    unsigned int t9;
    unsigned char t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t15;
    char *t16;
    char *t17;
    char *t18;
    char *t19;
    char *t20;

LAB0:    xsi_set_current_line(26, ng0);
    t1 = (t0 + 1512U);
    t2 = *((char **)t1);
    t1 = (t0 + 7512U);
    t3 = (t0 + 7795);
    t6 = (t5 + 0U);
    t7 = (t6 + 0U);
    *((int *)t7) = 0;
    t7 = (t6 + 4U);
    *((int *)t7) = 31;
    t7 = (t6 + 8U);
    *((int *)t7) = 1;
    t8 = (31 - 0);
    t9 = (t8 * 1);
    t9 = (t9 + 1);
    t7 = (t6 + 12U);
    *((unsigned int *)t7) = t9;
    t10 = ieee_std_logic_unsigned_equal_stdv_stdv(IEEE_P_3620187407, t2, t1, t3, t5);
    if (t10 != 0)
        goto LAB3;

LAB4:
LAB5:    t15 = (t0 + 5024);
    t16 = (t15 + 56U);
    t17 = *((char **)t16);
    t18 = (t17 + 56U);
    t19 = *((char **)t18);
    *((unsigned char *)t19) = (unsigned char)2;
    xsi_driver_first_trans_fast_port(t15);

LAB2:    t20 = (t0 + 4688);
    *((int *)t20) = 1;

LAB1:    return;
LAB3:    t7 = (t0 + 5024);
    t11 = (t7 + 56U);
    t12 = *((char **)t11);
    t13 = (t12 + 56U);
    t14 = *((char **)t13);
    *((unsigned char *)t14) = (unsigned char)3;
    xsi_driver_first_trans_fast_port(t7);
    goto LAB2;

LAB6:    goto LAB2;

}


extern void work_a_0832606739_0831356973_init()
{
	static char *pe[] = {(void *)work_a_0832606739_0831356973_p_0,(void *)work_a_0832606739_0831356973_p_1,(void *)work_a_0832606739_0831356973_p_2,(void *)work_a_0832606739_0831356973_p_3,(void *)work_a_0832606739_0831356973_p_4};
	xsi_register_didat("work_a_0832606739_0831356973", "isim/testbench_isim_beh.exe.sim/work/a_0832606739_0831356973.didat");
	xsi_register_executes(pe);
}
