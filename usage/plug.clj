; A plug
; basic high level concept: "State of the world + changes as they occur"

; so should the client app store multiple "shaped" in memory data-sets?
;   and then get changes pushed to multiple data-set?
;   eg: we have a data-set of relevant products+category facts
;       this fact-set is queried to show products for certain category
;       I doubt you would want to load all products and all categories on load...
;       so you would want to only load data for relevant categories on demand and then cache
;       how does that fit with con


;   and what about detail pages?
;       keep full facts on every product after it's loaded?

; or should the client app store a single fact-set and shape the data itself?
;   and then get changes pushed into a single fact-set?
;   eg: a single fact-set stores product facts and category facts
;       this fact-set is then queries to shape the list of products in a category
;       load full fact-set of products and categories on initial app load?
;          * I can't imagine this working for any sizeable fact-set

; * some mentions from clojurescript world say the single fact-set
;   doesn't work as well in contrained devices because of computational overhead


; at the end of the day are we just talking about an overly fancy way to cache data?
; perhaps it's just better to hit a REST endpoint for the requested data each time?
;    with some caching where it makes sense that expires after x amount of time?




#1 - perform a query with results as of current point in time,
then be notified of changes to said query.

-- so this is initial query+result+changes called a query feed? query plug?
-- clients can plug into the query plug.

where product/category = 11
    select product/name
           category/name



-- we have issues with the push... we need to know the id of the sub entity id's
-- in order to merge the data remotely.
-- so how about by default the id is always included in results for each property namespace.

-- so for this initial query feed

[{:product/id 1  :product/name "product 1" :category/id 3  :category/name "category 3"}
 {:product/id 2  :product/name "product 2" :category/id 3  :category/name "category 3"}]


-- so now if the category id 3 has it's category/name updated a change-set is triggered
[where-properties new-values]

[{:category/id 3} {:category/name "category 33"}]


-- which is then merged into the updated data-set
[{:product/id 1  :product/name "product 1" :category/id 3  :category/name "category 33"}
 {:product/id 2  :product/name "product 2" :category/id 3  :category/name "category 33"}]




