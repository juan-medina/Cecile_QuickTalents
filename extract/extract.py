###############################################################
# Program: package.py
# Description: Package the Addon
# Author: jamedina@gmail.com
# -------------------------------------------------------------
# Required Modules:
###############################################################

# -------------------------------------------------------------
# ACTUAL CODE BELLOW, DO NOT EDIT
# -------------------------------------------------------------

# system imports
import logging
from wowhead import WowheadScrapper

professions = {}

professions["books"] = 1
professions["leatherworking"] = 2
professions["tailoring"] = 3
professions["engineering"] = 4
professions["blacksmithing"] = 5
professions["cooking"] = 6
professions["alchemy"] = 7
professions["first-aid"] = 8
professions["enchanting"] = 9
professions["jewelcrafting"] = 11
professions["inscription"] = 12

expansions = {}
expansions[1] = "Vanilla"
expansions[2] = "BC"
expansions[3] = "Woltk"
expansions[4] = "Cataclysm"
expansions[5] = "Pandaria"
expansions[6] = "WoD"
expansions[7] = "Legion"

log = None


def GetRecipesExpansion(name, expansion):
    scrapper = WowheadScrapper()

    recipes = scrapper.getRecipes(name, expansion)

    if recipes is None:
        recipes = []

    log.info("recipes found: %d", len(recipes))

    cont = 1
    complete = {}
    incomplete = {}
    previous_percent = -1

    for recipe in recipes:
        id = scrapper.getRecipeDetail(recipe)

        percent = int((cont * 100) / len(recipes))
        cont = cont + 1
        if not (percent == previous_percent):
            previous_percent = percent
            log.info("progress %d%%", percent)

        if not (id is None):
            complete[recipe] = id
        else:
            incomplete[recipe] = id

    return complete


def GetRecipes(name):

    log.info("Getting recipes for: %s", name)

    total_data = {}
    for expansion in expansions.keys():
        log.info("Getting expansion: %s", expansion)
        expansion_recipes = GetRecipesExpansion(name, expansion)
        total_data[expansion] = {'name': expansions[expansion],
                                 'recipes': expansion_recipes}

    print(' ')
    print('--' + name)
    print('local PROFESSION_INDEX = ' + str(professions[name]) + ';')
    print(' ')

    for expansion in expansions.keys():

        print("--" + total_data[expansion]['name'])
        recipes = total_data[expansion]['recipes']

        for recipe in recipes.keys():
            print('mod.recipes[{0}]={1};'.format(
                recipe, recipes[recipe]))

        print(' ')

if __name__ == '__main__':

    LOG_FORMAT = "%(asctime)s - %(name)s - %(levelname)s - %(message)s"
    logging.basicConfig(level=logging.INFO, format=LOG_FORMAT)

    log = logging.getLogger(__name__)

    try:

        log.info("start to extract data")

        GetRecipes("inscription")

    except Exception as ex:
        logging.error(ex, exc_info=True)
        raise ex
