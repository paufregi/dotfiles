## Git Prompt

git_info() {
   ! git rev-parse --is-inside-work-tree > /dev/null 2>&1 && return

   if [[ -e .git/rebase-apply ]]; then
        INFO=$(cat .git/rebase-apply/onto | cut -c -8)
   else
        INFO=$(git symbolic-ref --short HEAD)
   fi

   REPO="%B%F{blue}git:(%F{red}$INFO%F{blue})%f"
   CLEAN="%B%F{green}✔%b%f"
   DIRTY="%B%F{yellow}✗%b%f"

   if [[ -n $(git status --porcelain  2> /dev/null) ]] then
      echo $REPO $DIRTY
   else
      echo $REPO $CLEAN
   fi
}