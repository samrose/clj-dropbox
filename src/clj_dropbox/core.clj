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

(defn meta-data [app path]
   (let [file-list (dbxlist app path)] 
     (for [metadata (.getEntries file-list)] 
       { :name (.getName metadata) 
         :lpath (.getPathLower metadata) 
         :rev (.getRev metadata)
         :id (.getId metadata) 
         :path_display (.getPathDisplay metadata) 
         :client_modified (.getClientModified metadata)
         :server_modified (.getServerModified metadata)
         :is_downloadable (.getIsDownloadable metadata)
         :sharing_metadata (dbxsharedlinks app (.getPathLower metadata))})))
         


(defn dbxsharedlinks [app path]
  (let [config (dbxconfig app)
         client (dbxclient config)
         sharing (.sharing client)
         sllist (.listSharedLinksBuilder sharing)
         wpath (.withPath sllist path)
         wdirect (.withDirectOnly wpath true)
         start (.start wdirect)]
         
    
    (try (.getLinks start)
         (catch Exception e (println e))))) 
           ;(bean (.getFileMetadata sharing path))))))



;(println (dbxlist "cdasdata" "/cdas21research"))
(println (meta-data "cdasdata" "/cdas21research"))
;(dbxsharedlinks "cdasdata" "/cdas21research/pg op ed article - 2012.pdf")

;(dbxlist "cdasdata" "/cdas21research")
;(dbxdownload "cdasdata" "/cdas21research/local food report_full report.pdf" "5abacf910fd80002860c4" "/home/samrose/Desktop/test-dbxdl/blah5.pdf")
