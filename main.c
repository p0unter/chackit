#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "commands.h"

int main(int argc, char *argv[]) {
    if (argc > 1) {
        int idx = findCommand(argv[1]);
        if (idx >= 0) {
            if (commands[idx].output != NULL) {
                printf("%s", commands[idx].output);
            } else if (strcmp(commands[idx].command, "--help") == 0) {
                printHelp();
            } else {
                exit(EXIT_FAILURE);
            }
        } else {
            printf("Unknown command: %s\nLearn commands: --help\n", argv[1]);
        }
    } else {
        printf("No command provided.\nLearn commands: --help\n");
    }

    return 0;
}