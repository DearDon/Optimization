program parabola
	real*8 t0,t1,t2,t,e,a1,a2
	t1=0.0;t0=1.0;t2=2.0;e=0.001;t=0.0;a1=0.0;a2=0.0
	open(14,file="Parabola")
	write(14,"(3(a13))")"t1","t0","t2"
	do
		write(14,"(f13.6,f13.6,f13.6)")t1,t0,t2
		a1=(t0**2.0-t2**2.0)*(8.0*t1**3-2.0*t1**2.0-7.0*t1+3.0)&
		+(t2**2.0-t1**2.0)*(8.0*t0**3.0-2.0*t0**2.0-7.0*t0+3.0)&
		+(t1**2.0-t0**2.0)*(8.0*t2**3.0-2.0*t2**2.0-7.0*t2+3.0)
		a1=a1/((t1-t0)*(t0-t2)*(t2-t1))
		a2=(t0-t2)*(8.0*t1**3-2.0*t1**2-7.0*t1+3.0)&
		+(t2-t1)*(8.0*t0**3-2.0*t0**2-7.0*t0+3.0)&
                +(t1-t0)*(8.0*t2**3-2.0*t2**2-7.0*t2+3)
		a2=a2/((t1-t0)*(t0-t2)*(t2-t1))
		t=a1/(2*a2)
		if((((t-t0)**2)**0.5)<e)exit
		if(t-t0)10,10,20
		10 if((8*t**3-2*t**2-7*t+3)-(8*t0**3-2*t0**2-7*t0+3))101,101,102
		20 if((8*t**3-2*t**2-7*t+3)-(8*t0**3-2*t0**2-7*t0+3))201,201,202
		101 t2=t0;t0=t; goto 30
		102 t1=t; goto 30
		201 t1=t0;t0=t; goto 30
		202 t2=t; goto 30
!程序编到此，继续编写两个if语句，
!记得拷地震学的电子书,以及还矩阵理论

		30 cycle
	end do
	write(14,"(f13.6,f13.6,f13.6,f13.6)")t1,t,t2,(8*t**3-2*t**2-7*t+3)
	close(14)
end program parabola


