###############################################################
# Class: wowhead.py
# Description: scrapp wowhead.com
###############################################################

# system imports
import re
import requests
from lxml import html
import re
import array
import logging


class WowheadScrapper:

    BASE_URL = "http://legion.wowhead.com/"
    RECIPE_LIST_URL = "/items/recipes/{0}?filter=166;{1};0"
    ITEM_DETAIL_URL = "/item={0}"

    def __init__(self):

        self.log = logging.getLogger(self.__class__.__name__)
        self.log.info("WowheadScrapper init")

        self.recipesExpr = re.compile(ur'\_\[(\d+)\]')
        self.itemExpr = re.compile(ur'^\/item\=(\d+)')

    def getPage(self, relative):

        for page_try in range(5):
            content = ""
            self.last_content = ""

            try:

                self.log.info("Gettig page: %s, try %d", relative,
                              page_try + 1)

                url = self.BASE_URL + relative
                self.last_url = url
                http_request = requests.get(url, headers={
                    'User-Agent': 'Mozilla/5.0'})

                self.log.info("Generate HTML tree")

                content = http_request.content
                self.last_content = content

                tree = html.fromstring(content)

                return tree

            except Exception as ex:
                self.log.error("Exception in get page %s", str(ex))
                self.log.info(content)

        raise Exception("unable to get the page")

    def getRecipes(self, type, expansion):

        try:
            self.log.info("Getting recipes type: %s, %d", type, expansion)

            list_url = self.RECIPE_LIST_URL.format(type, expansion)

            tree = self.getPage(list_url)

            data_node = tree.xpath(
                '//div[@class="listview"]/following-sibling::script')[0].text

            recipes = re.findall(self.recipesExpr, data_node)

            return recipes

        except Exception as ex:
            self.log.error("Exception getting recipes %s", str(ex))

    def getRecipeDetail(self, recipe):

        try:
            self.log.info("Getting recipe detail: %s", recipe)

            item_url = self.ITEM_DETAIL_URL.format(recipe)

            tree = self.getPage(item_url)

            containers = tree.xpath(
                '//noscript/table/tr/td/span/a')

            for container in containers:
                link = container.get("href")
                item = re.search(self.itemExpr, link)
                if not(item is None):
                    item = item.groups()[0]
                    return item
            return None

        except Exception as ex:
            self.log.error("Exception getting recipes %s", str(ex))
