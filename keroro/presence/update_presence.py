import os, json, sys
from keroro.utils import mapper, config, common

def save_presence(presence_map):
    with open(os.path.join(sys.path[0], 'presence.json'), 'w') as f:
        f.seek(0)
        json.dump(presence_map, f, indent = 4)
        f.truncate()

def run():
    file_path = sys.argv[1] # First argument is the current video's file path
    folder_path, file_name = os.path.split(file_path)
    folder_map = mapper.get_map()

    if folder_path not in folder_map:
        save_presence({})
        quit()

    title = folder_map[folder_path]['title']
    watched_episode = str(common.get_episode_number(file_path, folder_map))
    poster = folder_map[folder_path]['poster']
    link = folder_map[folder_path]['link']
    percent = sys.argv[2] # Second argument is the percent completion of the current video
    username = config.get_config()['anilist_user']

    save_presence({'title': title, 'episode': str(watched_episode), 'poster': poster, 'link': link, 'percent': percent, 'username': username})
