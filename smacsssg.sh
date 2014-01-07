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
echo "_$module.scss"

# Output CSS
filename="_$module.scss"
echo ".$module{} " > $filename
for component in ${Components[@]}
do
	echo ".$module$separator$component{} " >> $filename
done

cat $filename

echo ""
echo "****************************************"
echo ""

# Output HTML
echo "<$node class='$module'>"
for component in ${Components[@]}
do
	echo -e "\t<$node class='$module$separator$component'>$module$separator$component</div>"
done
echo "</$node>"
