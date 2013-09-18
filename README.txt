SSHReplicator
=============

SSHReplicator is a bash script for automatic creation of ssh based port forwarding.

Client

The SSHReplicator client part is composed of some common files that are unmodified ad a startup script that can be copied and edited for build more port forwarding between different computers.

The files are:
/etc/init.d/tunneling1 	Start script where there are all configurable parameters.
/etc/tunneling/keyok 	SSH private without password
/sbin/tunneling/tunnel 	Common script part.
/var/log/tunnelingX 	Serever connection log, differentiates between tunnels, to X is sobstituted the tunnel id, auto generated.
/sbin/tunneling/tunnelX 	Symbolic link to the file /sbin/tunneling/tunnel to X is sobstituted tunnel id, auto generated.
/sbin/tunneling/miasshX 	Symbolic link to the ssh command, X is sobstituted with tunnel id.

For build more port fowarding it's sufficient copy the file /etc/init.d/tunneling1 to /etc/init.d/tunneling2, then modify the TUNNELID to 2, it must be diffrent between al tunnesl on the same client, and modify also REMOTEHOST, LOGINNAME and the TUNNELOPTIONS parameters.

The start the client use the command "/etc/init.d/tunnelingX start", to stop it "/etc/init.d/tunnelingX stop", to X you must substitute the tunnel id.

Server

On the server must be copied tge file tunnelcommand.sh common to all clients, and add to the authorized_keys file, in the users home used for tunneks, the publics keys allowed to connect it.

The server record different connections log, that in log name have the tcp/ip and the tunnel id.
~/tunnelcommand.sh 	Script that make some minimum traffic avoid connection fall.
~/tunnelogX_Y.log 	Connection log, one for each tunnel, to X is sobstitute the tunnel id, to Y the tcp/ip of the client.
~/.ssh/authorized_keys 	Public keys rpository for authorized clients.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED 
WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A 
PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR 
ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED
TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) 
HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING 
NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY 
OF SUCH DAMAGE. 
