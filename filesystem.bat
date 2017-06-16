# ls -lart
dir
mkdir  dir1
cd dir1
echo 'This is a test' > new.txt
cat new.txt
mkdir  dir11
cp new.txt dir11/
mkdir  dir12
cd dir12
mv ../new.txt newhere.txt
findstr test newhere.txt
# grep
cd ../dir11
cat new.txt|findstr test
wc new.txt
file new.txt
ren new.txt new1.txt
#chmod 777 new1.txt chown
fc new1.txt ..\dir12\newhere.txt
sleep 5
cd ..
tree
cd ..
#rm -rf dir1
rd /s /q dir1