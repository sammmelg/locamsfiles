import RMS.ConfigReader as cr
import os
import argparse

def main():
    get_config()


def get_config():
    arg_parser = argparse.ArgumentParser(description=""" Tests if device opened for capture.""")
    arg_parser.add_argument('-c', '--config', nargs=1, metavar='CONFIG_PATH', type=str,
                            help="Path to a config file which will be used instead of the default one")
    cml_args = arg_parser.parse_args()
    config = cr.loadConfigFromDirectory(cml_args.config, os.path.abspath('.'))
    print(config.latitude)
    return config.latitude

if __name__ == '__main__':
    main()
