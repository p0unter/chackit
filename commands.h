#ifndef COMMANDS_H
#define COMMANDS_H

#define VERSION "1.0.0"

typedef struct {
    const char *command;
    const char *description;
    const char *output;
} Command;

extern Command commands[];
extern const int C_COUNT;

int findCommand(const char *cmd);
void printHelp(void);

#endif