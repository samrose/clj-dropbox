(ns cdas-data.core
  (:gen-class)
  (:require [clj-mw.api :as api]
            [clj-mw.asyncapi :as aapi])
  (:import

   [com.dropbox.core DbxRequestConfig]
   [com.dropbox.core.v2 DbxClientV2]))

(def settings-filename "settings.edn")
(def dir-settings (str settings-filename))
(def settings 
  (cond 
    (.exists (clojure.java.io/as-file settings-filename)) (read-string (slurp dir-settings))
    (.exists (clojure.java.io/as-file dir-settings)) (read-string (slurp dir-settings))
    :else (do (println "Using empty settings. Please set settings.edn"){})))

(defn dbxlist []
  (let [config (.build (DbxRequestConfig/newBuilder "cdasdata"))
         client (DbxClientV2. config (-> settings :dropbox :accessToken))
         files (.files client)
         res (.listFolder files "/cdas21research")
         _list (seq (.getEntries res))]
         
    (println _list))) 
  


(defn mw-edit-replace
  [& args]
  (api/login)
  (def edit-token (api/get-token))
  (def prom (aapi/edit-replace "TestAsync" {:content "Async testing 123 hello" :token edit-token}))
  (println (:body @prom)))


