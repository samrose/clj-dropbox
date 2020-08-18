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

(defn dbxconfig [app]
  (.build (DbxRequestConfig/newBuilder app)))

(defn dbxclient [config] 
  (DbxClientV2. config (-> settings :dropbox :accessToken)))


(defn dbxlist [app path]
  (let [config (dbxconfig app)
         client (dbxclient config)
         files (.files client)]
    (.listFolder files path)))

(defn copy-uri-to-file [uri file]
  (with-open [in (clojure.java.io/input-stream uri)
              out (clojure.java.io/output-stream file)]
    (clojure.java.io/copy in out)))

(defn dbxdownload [app path rev dlpath]
  (let [config (dbxconfig app)
         client (dbxclient config)
         files (.files client)
         download (.download files path rev)
         file-stream (.getInputStream download)]
    (copy-uri-to-file file-stream dlpath)))

(defn list-metadata [app path]
  (let [file-list (dbxlist app path)]
    (.getEntries file-list)))
;        ;(for [metadata (.getEntries file-list)])]
;    ;[(.getName metadata) (.getPathLower metadata) (.getRev metatadata)]))

;(println (list-metadata "cdasdata" "/cdas21research"))

;(dbxlist "cdasdata" "/cdas21research")
;(dbxdownload "cdasdata" "/cdas21research/local food report_full report.pdf" "5abacf910fd80002860c4" "/home/samrose/Desktop/test-dbxdl/blah5.pdf")
