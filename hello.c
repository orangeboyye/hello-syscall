#include <unistd.h>
#include <string.h>

int main(int argc, char *argv[])
{
	char str[] = "hello, world!\n";
	write(1, str, strlen(str));
} 
