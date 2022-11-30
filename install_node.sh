if type -p node > /dev/null
then
	echo "Node is installed"
	node --version
else
	if command -v nvm > /dev/null
	then
		echo "NVM already installed"
		echo "Moving to node installation"
	else
		echo "Installing NVM"
		curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
		export NVM_DIR="$HOME/.nvm"
		[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
		[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
		if command -v nvm > /dev/null
		then
			echo "NVM successfully installed"
		else
			echo "Unexpected error occured. Cannot install NVM"
			exit 1
		fi
	fi
	nvm install --lts
	if type -p node > /dev/null
	then
		echo "Node successfully installed"
	else
		echo "Unexpected error occured. Cannot install node"
		exit 1
	fi
fi
exit 0
