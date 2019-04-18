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

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "/home/th_tran/4IR Projet SysInfo/Projet_System_Info/PartieVHDL/TestALU.vhd";
extern char *IEEE_P_3620187407;

char *ieee_p_3620187407_sub_1496620905533649268_3965413181(char *, char *, char *, char *, char *, char *);


static void work_a_2141518212_2372691052_p_0(char *t0)
{
    char t12[16];
    char t13[16];
    char *t1;
    char *t2;
    int64 t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    int t10;
    int t11;
    char *t14;
    int t15;
    unsigned int t16;
    char *t17;
    unsigned int t18;
    unsigned char t19;
    char *t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;

LAB0:    t1 = (t0 + 2824U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(88, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 2632);
    xsi_process_wait(t2, t3);

LAB6:    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    xsi_set_current_line(93, ng0);
    t2 = (t0 + 5496);
    t5 = (t0 + 3208);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(94, ng0);
    t2 = (t0 + 5504);
    t5 = (t0 + 3272);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 8U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(95, ng0);
    t2 = (t0 + 5512);
    t5 = (t0 + 3336);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memcpy(t9, t2, 4U);
    xsi_driver_first_trans_fast(t5);
    xsi_set_current_line(96, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 2632);
    xsi_process_wait(t2, t3);

LAB10:    *((char **)t1) = &&LAB11;
    goto LAB1;

LAB5:    goto LAB4;

LAB7:    goto LAB5;

LAB8:    xsi_set_current_line(98, ng0);
    t2 = (t0 + 5516);
    *((int *)t2) = 0;
    t4 = (t0 + 5520);
    *((int *)t4) = 3;
    t10 = 0;
    t11 = 3;

LAB12:    if (t10 <= t11)
        goto LAB13;

LAB15:    xsi_set_current_line(103, ng0);

LAB25:    *((char **)t1) = &&LAB26;
    goto LAB1;

LAB9:    goto LAB8;

LAB11:    goto LAB9;

LAB13:    xsi_set_current_line(99, ng0);
    t5 = (t0 + 1352U);
    t6 = *((char **)t5);
    t5 = (t0 + 5408U);
    t7 = (t0 + 5524);
    t9 = (t13 + 0U);
    t14 = (t9 + 0U);
    *((int *)t14) = 0;
    t14 = (t9 + 4U);
    *((int *)t14) = 3;
    t14 = (t9 + 8U);
    *((int *)t14) = 1;
    t15 = (3 - 0);
    t16 = (t15 * 1);
    t16 = (t16 + 1);
    t14 = (t9 + 12U);
    *((unsigned int *)t14) = t16;
    t14 = ieee_p_3620187407_sub_1496620905533649268_3965413181(IEEE_P_3620187407, t12, t6, t5, t7, t13);
    t17 = (t12 + 12U);
    t16 = *((unsigned int *)t17);
    t18 = (1U * t16);
    t19 = (4U != t18);
    if (t19 == 1)
        goto LAB16;

LAB17:    t20 = (t0 + 3336);
    t21 = (t20 + 56U);
    t22 = *((char **)t21);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    memcpy(t24, t14, 4U);
    xsi_driver_first_trans_fast(t20);
    xsi_set_current_line(100, ng0);
    t3 = (100 * 1000LL);
    t2 = (t0 + 2632);
    xsi_process_wait(t2, t3);

LAB20:    *((char **)t1) = &&LAB21;
    goto LAB1;

LAB14:    t2 = (t0 + 5516);
    t10 = *((int *)t2);
    t4 = (t0 + 5520);
    t11 = *((int *)t4);
    if (t10 == t11)
        goto LAB15;

LAB22:    t15 = (t10 + 1);
    t10 = t15;
    t5 = (t0 + 5516);
    *((int *)t5) = t10;
    goto LAB12;

LAB16:    xsi_size_not_matching(4U, t18, 0);
    goto LAB17;

LAB18:    goto LAB14;

LAB19:    goto LAB18;

LAB21:    goto LAB19;

LAB23:    goto LAB2;

LAB24:    goto LAB23;

LAB26:    goto LAB24;

}


extern void work_a_2141518212_2372691052_init()
{
	static char *pe[] = {(void *)work_a_2141518212_2372691052_p_0};
	xsi_register_didat("work_a_2141518212_2372691052", "isim/TestALU_isim_beh.exe.sim/work/a_2141518212_2372691052.didat");
	xsi_register_executes(pe);
}
