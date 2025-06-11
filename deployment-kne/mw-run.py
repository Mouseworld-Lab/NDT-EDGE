import click
import subprocess
import time

@click.command()
def main():

    subprocess.run(['ansible-playbook', 'mw-deployment.yaml'])
    subprocess.run(['ansible-playbook', 'mw-config.yaml'])
    subprocess.run(['ansible-playbook', 'mw-mirror.yaml'])

    input("Pulsa ENTER para reproducir el pcap...")

    subprocess.run(['ansible-playbook', 'mw-replay.yaml'])

    input("Pulsa ENTER para terminar...")
    
if __name__ == '__main__':
    main()
