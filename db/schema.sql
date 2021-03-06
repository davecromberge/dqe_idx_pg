DROP TABLE IF EXISTS metrics;
CREATE TABLE metrics (
   id           bigserial PRIMARY key,
   tag_bucket   varchar NOT NULL,
   tag_metric   varchar NOT NULL,
   bucket       varchar NOT NULL,
   metric_0     text NOT NULL,
   metric_1     text,
   metric_2     text,
   metric_3     text,
   metric_4     text,
   metric_5     text,
   metric_6     text,
   metric_7     text,
   metric_8     text,
   metric_9     text
);

CREATE UNIQUE INDEX metrics_idx ON metrics (tag_bucket, tag_metric_0, tag_metric_1, tag_metric_2, tag_metric_3, tag_metric_4, tag_metric_5, tag_metric_6, tag_metric_7, tag_metric_8, tag_metric_9);

DROP TABLE IF EXISTS tags;
CREATE TABLE tags (
   metric_id bigserial REFERENCES metrics (id) ON DELETE CASCADE,
   name   text NOT NULL,
   value  text NOT NULL
);
CREATE UNIQUE INDEX tags_idx ON tags (metric_id, name, value);


DROP TABLE IF EXISTS metric_elements;
CREATE TABLE metric_elements (
 metric_id bigserial REFERENCES metrics (id) ON DELETE CASCADE,
 position integer CHECK (position > 9),
 tag_metric text
);
CREATE UNIQUE INDEX metric_elements_idx ON metric_elements (metric_id, position, tag_metric);
