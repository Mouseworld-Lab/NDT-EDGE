import click
import subprocess
import time

@click.command()
def main():

    subprocess.run(['ansible-playbook', 'mw-deployment.yaml'])
    subprocess.run(['ansible-playbook', 'mw-config.yaml'])
    subprocess.run(['ansible-playbook', 'mw-mirror.yaml'])


    input("Pulsa ENTER para ejecutar el undeploy...")
    
    # After executing, automatically execute mw-undeploy.yaml
    subprocess.run(['ansible-playbook', 'mw-undeploy.yaml'])

if __name__ == '__main__':
    main()
