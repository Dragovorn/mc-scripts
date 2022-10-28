#!/bin/bash
echo "Creating new minecraft server..."

read -p "Directory Name: " run_dir
read -p "Install Check Directory: " install_dir
read -p "Screen Name ($run_dir): " screen_name

if [ -z "$screen_name" ]; then
  screen_name="$run_dir"
fi

read -p "Update command: " update_cmd
read -p "Run script: " run_script

echo "Creating run directory: $run_dir ..."
mkdir -p "$run_dir"
run_dir=$(realpath "$run_dir")

echo "Creating install directory: $install_dir ..."
mkdir -p "$install_dir/mods/"
install_dir=$(realpath "$install_dir")

echo "Creating .scripts directory..."
mkdir -p "$run_dir/.scripts/"

link=(
  "start.sh"
  "server-daemon.sh"
  ".scripts/functions.sh"
)

echo "Linking scripts..."
for script in ${link[@]}; do
  real_script=$(realpath "$script")
  in_script="$run_dir/$script"
  echo "$real_script -> $in_script"
  ln -s "$real_script" "$in_script"
done

echo "Linking complete!"
echo "Creating config file..."
config_file="$run_dir/config.sh"
touch "$config_file"

echo "SCREEN_NAME=\"$screen_name\"" >> "$config_file"
echo "INSTALL_DIR=\"$install_dir\"" >> "$config_file"
echo "RUN_DIR=\"$run_dir\"" >> "$config_file"
echo "RUN_SCRIPT=\"$run_script\"" >> "$config_file"
echo "UPDATE_COMMAND=\"$update_cmd\"" >> "$config_file"

read -p "Do you agree to Mojang's EULA? (Y/N): " confirm

if [[ $confirm == [yY] || $confirm == [yY][eE][sS] ]]; then
  echo "eula=true" >> "$run_dir/eula.txt"
  echo "Agreed to Mojang EULA."
fi

echo "Done writing $config_file"
echo "Fin."
