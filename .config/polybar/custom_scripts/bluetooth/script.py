import subprocess


def extract_uuid(device):
    return device.lstrip('Device').strip().split(' ')[0].strip()

def extract_name(device):
    return ' '.join(device.strip().split(' ')[2:])

def list_paired():
    process = subprocess.Popen(['bluetoothctl', 'paired-devices'], stdout=subprocess.PIPE)
    output, error = process.communicate()
    
    if error:
        exit(1)

    return output.decode("utf-8").strip()


def is_connected(uuid):
    process = subprocess.Popen(['bluetoothctl', 'info', uuid], stdout=subprocess.PIPE)
    output, error = process.communicate()

    if error:
        exit(1)

    return 'Connected: yes' in output.decode("utf-8").strip()
  

if __name__ == '__main__':
    paired_devices = list_paired()
    
    connected = []
    for line in paired_devices.split('\n'):
        device_uuid = extract_uuid(line)

        if is_connected(device_uuid):
            name = extract_name(line)
            connected.append(name)

    print(' | '.join(connected))
    
