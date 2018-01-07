require 'page-object/page_factory'
require 'page-object'

World(PageObject::PageFactory)

#Place for settings like test_data.yml
TEST_DATA_DIR = "./features/support/test_data"