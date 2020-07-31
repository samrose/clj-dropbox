(ns clj-dropbox.core
  (:gen-class)
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

(defn dbxlist [path]
  (let [config (.build (DbxRequestConfig/newBuilder "cdasdata"))
         client (DbxClientV2. config (-> settings :dropbox :accessToken))
         files (.files client)
         res (.listFolder files path)
         _list (seq (.getEntries res))]
         
    (println _list))) 
