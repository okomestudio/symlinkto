target_path := $$HOME/.local/bin
script_name := symlinkto

$(target_path)/$(script_name):
	cp $(script_name) $(target_path)/$(script_name)

.PHONY: uninstall
uninstall:
	rm $(target_path)/$(script_name)
