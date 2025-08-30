NAME =	libft.a
DIRSR =	srcs/
DIROB =	objs/
DIRLI =	includes/
FILEH = libft.h 
FILEC =	ft_strlen.c \
		ft_isalpha.c \
		ft_isdigit.c \
		ft_isalnum.c \
		ft_isascii.c \
		ft_isprint.c \
		ft_memset.c \
		ft_bzero.c \
		ft_memcpy.c \
		ft_memmove.c \
		ft_strlcpy.c \
		ft_strlcat.c \
		ft_toupper.c \
		ft_tolower.c \
		ft_strchr.c \
		ft_strrchr.c \
		ft_strncmp.c \
		ft_memchr.c \
		ft_memcmp.c \
		ft_strnstr.c \
		ft_atoi.c \
		ft_calloc.c \
		ft_strdup.c \
		ft_substr.c \
		ft_strjoin.c \
		ft_strtrim.c \
		ft_split.c \
		ft_itoa.c \
		ft_strmapi.c \
		ft_striteri.c \
		ft_putchar_fd.c \
		ft_putstr_fd.c \
		ft_putendl_fd.c \
		ft_putnbr_fd.c
SRCS =	$(addprefix $(DIRSR), $(FILEC))
OBJS =	$(addprefix $(DIROB), $(FILEC:.c=.o))
HDRS =	$(addprefix $(DIRLI), $(FILEH))
FILEBONUS = ft_lstadd_back_bonus.c \
			ft_lstadd_front_bonus.c \
			ft_lstclear_bonus.c \
			ft_lstdelone_bonus.c \
			ft_lstlast_bonus.c \
			ft_lstnew_bonus.c \
			ft_lstsize_bonus.c \
			ft_lstiter_bonus.c \
			ft_lstmap_bonus.c
SRCSBONUS =	$(addprefix $(DIRSR), $(FILEBONUS))
OBJSBONUS =	$(addprefix $(DIROB), $(FILEBONUS:.c=.o))
CC =	cc
FLAGS =	-Wall -Wextra -Werror
AR =	ar -crs

all:		initdir $(NAME)

$(NAME):	$(OBJS)
			$(AR) $(NAME) $(OBJS)

$(DIROB)%.o:	$(DIRSR)/%.c $(HDRS)
				$(CC) $(FLAGS) -c $< -o $@ -I$(DIRLI)

# Création du dossier obj/ si nécessaire
initdir:
			mkdir -p $(DIROB)

bonus:		initdir $(OBJS) $(OBJSBONUS)
			$(AR) $(NAME) $(OBJS) $(OBJSBONUS)

$(DIROB)%_bonus.o:	$(DIRSR)/%_bonus.c $(HDRS)
					$(CC) $(FLAGS) -c $< -o $@ -I$(DIRLI)

clean:	
			rm -rf $(OBJS) $(OBJSBONUS)

fclean:		clean
			rm -rf $(NAME)

re:			fclean all

.PHONY:		all clean fclean re