echo "##################################"
echo "Configuring the platform for $1."
echo "##################################"
sponge pattern upsert -p $1/patterns/
xenia relationship upsert -p $1/relationships/
xenia view upsert -p $1/views/
xenia query upsert -p $1/querySets/
