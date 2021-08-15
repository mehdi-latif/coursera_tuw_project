# The Unix Workbench - Project
# makefile
all:README.md
README.md:guessinggame.sh
	echo "# Unix Workbench :"> README.md
	echo "Week 4 : Bash, Make, Git, and GitHub - guessinggame.sh" >> README.md
	echo "" >> README.md
	echo '## Date :' >> README.md;
	date >> README.md;
	# L=$(cat guessinggame.sh | wc -l)
	echo ""  >> README.md
	echo "## nb lines in guessinggame.sh " >> README.md;
	cat guessinggame.sh | wc -l >> README.md;
	echo ""  >> README.md
	echo "## Function : " >> README.md
	echo "\`\`\`" >> README.md
	tail -n 6 guessinggame.sh >> README.md
	echo "\`\`\`" >> README.md

clean:
	rm README.md
