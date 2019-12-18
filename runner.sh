git clone https://github.com/baalajimaestro/linux-clear --depth=1 kernel-source
cd kernel-source/ && scripts/install-git-hooks && curl -o linux-5.4.tar.xz http://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.4.tar.xz && scripts/tar-up.sh
rpmdev-setuptree
rm -rf ~/rpmbuild/SOURCES
mv ~/kernel-source/kernel-source ~/rpmbuild/SOURCES
cd ~/rpmbuild/SOURCES/ && yes | rpmbuild -bb kernel-default.spec
curl -sLo -u baalajimaestro:$GH_PERSONAL_TOKEN  ~/.ssh/id_ed25519 https://raw.githubusercontent.com/baalajimaestro/keys/master/id_ed25519
chmod 600 ~/.ssh/id_ed25519
for i in `ls ~/rpmbuild/RPMS/`
do
scp -r ~/rpmbuild/RPMS/$i baalaji20@storage.osdn.net:/storage/groups/b/ba/baalajimaestrobuilds/linux-clear/$i
done
