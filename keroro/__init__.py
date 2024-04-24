def run():
    import colorama
    from keroro.utils import config, mapper, continue_watching

    colorama.init()

    try:
        config.set_up()
        mapper.map()
        continue_watching.continue_watching()
    except KeyboardInterrupt:  # If user uses Ctrl-C, don't error
        print()
        quit()
