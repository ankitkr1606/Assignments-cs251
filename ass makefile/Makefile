all: App

App:prog.o thread.o
	gcc -o App prog.o thread.o -lm -lpthread

prog.o:prog.c common.h
	gcc -c prog.c -o prog.o
	
thread.o:thread_function.c common.h
	gcc -c thread_function.c -o thread.o

runtest:input.py params.txt
	python input.py>>result.txt
	
analyse:x.out y.out z.out w.out

x.out:result.txt params.txt
	python sec1.py >> x.out

y.out:result.txt params.txt
	python sec2.py >> y.out

z.out:result.txt params.txt
	python sec3.py >> z.out

w.out:result.txt params.txt
	python sec4.py >> w.out

plot:


report:


clean:
	rm -f *.o App result.txt

