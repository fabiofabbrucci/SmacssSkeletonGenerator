# SMACSS Skeleton Generator
separator="__"
node="div"

# Module Name
echo -n "Name of module > "
read module

# Loop Components
echo "(type ENTER to exit loop)"
Components=();
input="init"
while [ -n "$input" ]; do
	echo -n "Component > "
	read input
	if [ -n $input  ]; then
		Components=("${Components[@]}" $input)
	fi
done

echo ""
echo "****************************************"
echo ""

# Output HTML
echo ".$module{} "
for component in ${Components[@]}
do
	echo ".$module$separator$component{} "
done

echo ""
echo "****************************************"
echo ""

# Output CSS
echo "<$node class='$module'>"
for component in ${Components[@]}
do
	echo -e "\t<$node class='$module$separator$component'></div>"
done
echo "</$node>"
