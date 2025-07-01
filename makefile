# Compiler and compilation flags
CC = gcc
CFLAGS = -Wall -Wextra -g

# Source files
SRCS = main.c commands.c

# Output directory variable
OBJDIR = build
OUTDIR = output

# Object files derived from source files
OBJS = $(patsubst %.c,$(OBJDIR)/$(OUTDIR)/%.o,$(SRCS))

# Output executable name
TARGET = $(OBJDIR)/program

# Default target: build the program
all: $(TARGET)

# Link object files to create the executable
$(TARGET): $(OBJS)
	$(CC) $(CFLAGS) -o $@ $^

# Compile .c files into .o object files
$(OBJDIR)/$(OUTDIR)/%.o: %.c | $(OBJDIR)/$(OUTDIR)
	$(CC) $(CFLAGS) -c $< -o $@

# If don't have build directory, create.
$(OBJDIR)/$(OUTDIR):
	mkdir -p $(OBJDIR)/$(OUTDIR)

# Clean target: remove object files and executable
clean:
	rm -rf $(OBJDIR)/$(OUTDIR) $(TARGET)

# Declare targets that are not files
.PHONY: all clean
