echo "Comment name and Student Id at the top of all .ts files in the pwd"
sed  -i '1i //Wikus van Pareen ID: 15563941' *.ts

# Iterate through all sub directories
for d in */; do
    if [ -d "$d" ]; then

        # Skip node_modules folder
        if [ "$d" != "node_modules/" ]; then
            # copy the script to use in the recursive function
            cp maintenance.sh "$d"
            cd "$d"
            echo "Start recursive function"
            bash maintenance.sh
            echo "remove script from directory"
            rm maintenance.sh
            echo "Iterate back to starting directory"
            cd ..
        fi
    fi
done

