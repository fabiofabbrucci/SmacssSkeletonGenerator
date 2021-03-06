# SMACSS Skeleton Generator
node="div"

# Module Name
echo -n "Name of module > "
read module

# Separator
echo -n "Separator (eg -, --, _, __) > "
read separator

# Loop Components
echo "(press ENTER to exit loop)"
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
echo "Filename target: _$module.scss"
echo ""


# Output CSS
echo "CSS:"
echo ""
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
echo "HTML:"
echo ""
echo "<$node class='$module'>"
for component in ${Components[@]}
do
	echo -e "\t<$node class='$module$separator$component'>$module$separator$component</div>"
done
echo "</$node>"
