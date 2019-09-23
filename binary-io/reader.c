#include <stdio.h>
#include <stdlib.h>

#define NVALUES 10

void usage(char *progname) {
    printf("Usage: %s fname\n", progname);
}

int main(int argc, char *argv[]) {

    FILE *fp;
    int *values;
    int i;
    size_t retval;
    
    if (argc < 2) {
        usage(argv[0]);
        exit(EXIT_SUCCESS);
    } else {
        if (NULL == (fp = fopen(argv[1], "r"))) {
            fprintf(stderr, "Failed to open file %s\n", argv[1]);
            exit(EXIT_FAILURE);
        } else {

            values = (int *) malloc(NVALUES * sizeof(int));
            retval = fread(values, sizeof(int), NVALUES, fp);
            if (retval < (size_t) NVALUES) {
                fprintf(stderr, "Failed to read %d values from  file %s\n",
                        NVALUES, argv[1]);
                free(values);
                exit(EXIT_FAILURE);
            } else {
                for (i = 0; i < NVALUES; i++) {
                    printf(" %d", values[i]);
                }
                printf("\n");
                free(values);
            }
        }
    }                        

    return 0;
}
