program potts
  implicit none

  real*8                     :: x, totalenergy													
  real*8, parameter          :: t= 0.0001														
  integer, parameter         :: lx= 3, ly= 3, n_dir= 4, mcs= 100000
  integer, dimension(n_dir)  :: vizinhos 
  integer, dimension(lx*ly)  :: pontos
  integer                    :: y, Ei, Ef, n
x= 2
y= 3


call RANDOM_SEED

!--------------------------------------------------------------------------------------------
 
call cond_i (pontos, lx , ly) 
!print*,pontos
			
!--------------------------------------------------------------------------------------------

!print*, local_energy (n , n_dir)

totalenergy= total_energy(lx, ly, n_dir)
!print*, totalenergy

!---------------------------------------------------------------------------------------------

call metropolis (lx, ly, n, totalenergy)
!print*, "pontos:", pontos
!---------------------------------------------------------------------------------------------

!d=1				!escolher d entre 0 ou 1 
!if (d==0) then
	
!	print*, nn(lx,n,x,y)
!endif
!if (d==1) then
!		call ll (lx,n,x,y)
!		print*, x,y
!endif

stop 0
contains 

!--------------------------------------------------------------------------------------------------

real*8 function nn (lx , n , x , y) !dado x , y , lx obtemos n
implicit none
real*8 :: n , x , y , lx
n = x+(y-1)*lx						!da a posição nn da rede
nn = n

return
end function nn

!--------------------------------------------------------------------------------------------------

subroutine ll(lx , n , x , y) 	!dado n e lx obtemos o ponto (x,y)
implicit none

real*8 :: n , x , y , lx

y = 1+int(n/lx)
x = n-(y-1)*lx

return
end subroutine ll

!----------------------------------------------------------------------------------------------------

subroutine cond_i(pontos, lx , ly) 	!povoa a rede da esquerda para direita e de baixo para cima (> ; ^)
implicit none

integer:: j , lx , ly
real*8:: x
integer, dimension(lx*ly) :: pontos !array correspondente n° de pontos
x = 0 

do j =1,lx*ly						
  call RANDOM_NUMBER (x)
  if (x >= 0.5) then
    pontos(j) = 1					
  else
    pontos(j) = 0
  endif
enddo
return
end subroutine cond_i

!------------------------------------------------------------------------------------------------------

real*8 function local_energy(n, n_dir)
implicit none

integer ::  i, energy, n_dir, n
energy=0

do i=1, n_dir
vizinhos(1) = n + 1
vizinhos(2) = n - lx
vizinhos(3) = n + lx
vizinhos(4) = n - 1

if (mod(n, lx) == 0) then 	!mod (função para resto da divisão) / direita da rede
	vizinhos(1) = n - lx + 1 !faz o vizinho ser o da mesma linha porém da outra extremidade da rede 
end if 
   
if (n<=lx) then 			!pontos de baixo
	vizinhos(2) = n + lx*ly -lx
end if

if (mod(n-1, lx) == 0) then  !pontos da esquerda
	vizinhos(4) = n + lx -1 

end if 
if (n > (lx*ly)-lx) then	!pontos de cima 
	vizinhos(3) = n - lx*ly + lx 
end if 

if (pontos(n) == pontos(vizinhos(i))) then 
   energy = energy + 1  
   endif
enddo

local_energy = -1 * energy

return
end function local_energy 
!------------------------------------------------------------------------------------------------------

real*8 function total_energy(lx, ly, n_dir)
implicit none

integer :: lx, ly, n_dir, i
real*8 :: soma
               
do i=1, lx*ly
	soma= soma + local_energy(i, n_dir)
enddo
total_energy= soma/2

return
end function total_energy 

!------------------------------------------------------------------------------------------------------

subroutine metropolis (lx, ly, n, totalenergy)  
implicit none
real*8:: x, dE, p, totalenergy, e= 0, em= 0 , e_spin = 0, r
integer:: lx, ly, i, Ei, Ef, j, counte= 0, n

do j=1, mcs
do i=1, lx*ly                                   !para a rede inteira
		call random_number (x) 
		n= (x*lx*ly)+1                          ! adicionar n aleatório e inteiro 
		Ei= local_energy(n , n_dir)
		!print*, "Pontos antes do flip: ", pontos(n) 																								
		if (pontos(n)== 1) then					!flip do spin
			pontos(n)= 0

		else
			pontos(n)= 1
	endif																								
Ef= local_energy(n , n_dir) 					! energia após o flip	(não se poderia operar com total energy?)						
dE= Ei - Ef
p= exp(-dE/t)

!print*, "n:", n
!print*, "Energia local antes do flip:" ,Ei , "depois do flip:", Ef					! p para condição de aceitação da configuração 
!print*, "dE:", dE
!print*, "p:", p
   

call random_number (x)
!print*, "x:", x 

if (dE>0) then 
	if (x < p) then 											
		totalenergy= totalenergy + dE							
	else
		if (pontos(n)== 1) then						! else devolve a configuração de antes 
			pontos(n)= 0
		else
			pontos(n)= 1
		!print*, "Pontos depois do flip: ", pontos(n)
		endif 
	endif
endif 			

enddo	

if  (mod(j,100) == 0) then
	counte= counte + 1 	
	e_spin = e_spin + totalenergy
endif
enddo
open (10,file='energy.txt')
write (10,*) totalenergy
 Close(10)
print*, "totalenergy:", totalenergy
em= e_spin/dble(counte)
r=em/(lx*ly)
!print*, "r:", r
print*, "energia média:", em
return 

end subroutine metropolis

!------------------------------------------------------------------------------------------------------

end program potts

