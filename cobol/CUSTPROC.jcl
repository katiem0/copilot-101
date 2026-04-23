//CUSTPROC JOB (ACCT),'CUSTOMER REPORT',
//             CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
//*
//* Run the CUSTPROC batch program to produce a customer report.
//* Useful for a Copilot demo on explaining / modernizing JCL.
//*
//STEP1    EXEC PGM=CUSTPROC
//STEPLIB  DD DSN=USER.LOADLIB,DISP=SHR
//CUSTFILE DD DSN=USER.CUSTOMER.DATA,DISP=SHR
//CUSTRPT  DD SYSOUT=*
//SYSOUT   DD SYSOUT=*
//SYSPRINT DD SYSOUT=*
//
